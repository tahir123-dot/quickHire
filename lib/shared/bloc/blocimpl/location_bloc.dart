import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:mobile/shared/data/dto/location_dto.dart';
import 'package:mobile/shared/data/repositories/location/location_repository.dart';
import '../event/location_event.dart';
import '../state/location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository repository;

  // yeh track karta hai ke user ki location pehle se DB mein hai ya nahi -
  // isi ke hisab se Save button "Add" karega ya "Update"
  bool _hasExistingLocation = false;

  LocationBloc(this.repository) : super(LocationInitial()) {
    on<LoadSavedLocationEvent>(_onLoadSavedLocation);
    on<LoadCurrentLocationEvent>(_onLoadCurrentLocation);
    on<MapMoveEndEvent>(_onMapMoveEnd);
    on<SearchLocationEvent>(_onSearchLocation);
    on<SaveLocationEvent>(_onSaveLocation);
  }

  // screen khulte hi yeh chalta hai - pehle DB check karta hai
  Future<void> _onLoadSavedLocation(
    LoadSavedLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationLoading());
    try {
      final entity = await repository.getLocation();
      _hasExistingLocation = true;

      final latLng = LatLng(entity.latitude, entity.longitude);
      final display = [
        entity.addressLine,
        entity.city,
        entity.state,
      ].where((e) => e.trim().isNotEmpty).join(', ');

      // ignore: avoid_print
      print('📦 Existing saved location mil gayi: $display');

      emit(
        LocationLoaded(
          selectedLocation: latLng,
          address: display.isEmpty ? 'Address nahi mila' : display,
          addressLine: entity.addressLine,
          city: entity.city,
          state: entity.state,
          countryCode: entity.countryCode,
          recenterCamera: true,
          hasExistingLocation: true,
        ),
      );
    } catch (e) {
      // location abhi save nahi hui (404 ya koi aur wajah) -
      // GPS se current location le lo, yeh naya "Add" flow hoga
      // ignore: avoid_print
      print('📦 Koi saved location nahi mili, GPS use karenge: $e');
      await _onLoadCurrentLocation(LoadCurrentLocationEvent(), emit);
    }
  }

  Future<void> _onLoadCurrentLocation(
    LoadCurrentLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationLoading());
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(LocationError('Location service band hai, please on karo'));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(LocationError('Location permission denied'));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(
          LocationError('Permission permanently denied, settings se on karo'),
        );
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings(accuracy: LocationAccuracy.high),
      );
      final latLng = LatLng(position.latitude, position.longitude);
      final parts = await _getAddressParts(latLng);

      debugPrintAddress(latLng, parts);

      emit(
        LocationLoaded(
          selectedLocation: latLng,
          address: parts.display,
          addressLine: parts.addressLine,
          city: parts.city,
          state: parts.state,
          countryCode: parts.countryCode,
          recenterCamera: true,
          hasExistingLocation: _hasExistingLocation,
        ),
      );
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }

  Future<void> _onMapMoveEnd(
    MapMoveEndEvent event,
    Emitter<LocationState> emit,
  ) async {
    final parts = await _getAddressParts(event.finalCenter);

    debugPrintAddress(event.finalCenter, parts);

    emit(
      LocationLoaded(
        selectedLocation: event.finalCenter,
        address: parts.display,
        addressLine: parts.addressLine,
        city: parts.city,
        state: parts.state,
        countryCode: parts.countryCode,
        recenterCamera: false,
        hasExistingLocation: _hasExistingLocation,
      ),
    );
  }

  Future<void> _onSearchLocation(
    SearchLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    final query = event.query.trim();
    if (query.isEmpty) return;

    // ignore: avoid_print
    print('🔍 Searching for: $query');

    emit(LocationLoading());
    try {
      final uri = Uri.https('nominatim.openstreetmap.org', '/search', {
        'q': query,
        'format': 'json',
        'limit': '1',
      });

      final response = await http.get(
        uri,
        headers: {
          'User-Agent': 'QuickHireApp/1.0 (contact: vibrextech@example.com)',
        },
      );

      if (response.statusCode != 200) {
        emit(LocationError('Search API error: ${response.statusCode}'));
        return;
      }

      final List<dynamic> results = jsonDecode(response.body);

      if (results.isEmpty) {
        emit(LocationError('Yeh location nahi mili, dobara try karo'));
        return;
      }

      final result = results.first;
      final latLng = LatLng(
        double.parse(result['lat']),
        double.parse(result['lon']),
      );
      final parts = await _getAddressParts(latLng);

      debugPrintAddress(latLng, parts);

      emit(
        LocationLoaded(
          selectedLocation: latLng,
          address: parts.display,
          addressLine: parts.addressLine,
          city: parts.city,
          state: parts.state,
          countryCode: parts.countryCode,
          recenterCamera: true,
          hasExistingLocation: _hasExistingLocation,
        ),
      );
    } catch (e) {
      // ignore: avoid_print
      print('🔍 Search exception: $e');
      emit(LocationError('Search mein error: $e'));
    }
  }

  Future<void> _onSaveLocation(
    SaveLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    final current = state;
    if (current is! LocationLoaded) {
      emit(LocationError('Pehle location select karo'));
      return;
    }

    emit(LocationSaving());
    try {
      if (_hasExistingLocation) {
        // pehle se location saved hai - UPDATE karo
        final dto = UpdateLocationDto(
          countryCode: current.countryCode,
          addressLine: current.addressLine,
          city: current.city,
          state: current.state,
          latitude: current.selectedLocation.latitude,
          longitude: current.selectedLocation.longitude,
        );

        // ignore: avoid_print
        print('🔄 Updating location: ${dto.toJson()}');

        final updated = await repository.updateLocation(dto);
        emit(LocationSaved(updated));
      } else {
        // pehli dafa - ADD karo
        final dto = LocationDto(
          countryCode: current.countryCode,
          addressLine: current.addressLine,
          city: current.city,
          state: current.state,
          latitude: current.selectedLocation.latitude,
          longitude: current.selectedLocation.longitude,
        );

        // ignore: avoid_print
        print('✅ Saving new location: ${dto.toJson()}');

        final saved = await repository.addLocation(dto);
        _hasExistingLocation = true;
        emit(LocationSaved(saved));
      }
    } catch (e) {
      // ignore: avoid_print
      print('❌ Save error: $e');
      emit(LocationError('Location save nahi hui: $e'));
    }
  }

  Future<_AddressParts> _getAddressParts(LatLng latLng) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isEmpty) {
        return _AddressParts(
          display: 'Address nahi mila',
          addressLine: 'N/A',
          city: 'N/A',
          state: 'N/A',
          countryCode: 'N/A',
        );
      }

      final place = placemarks.first;

      final addressLine = [
        place.street,
        place.subLocality,
      ].where((e) => e != null && e.trim().isNotEmpty).join(', ');

      final city = place.locality?.isNotEmpty == true
          ? place.locality!
          : (place.subAdministrativeArea ?? 'N/A');

      final state = place.administrativeArea ?? 'N/A';
      final countryCode = place.isoCountryCode ?? 'N/A';

      final display = [
        addressLine,
        city,
        state,
        place.country,
      ].where((e) => e != null && e.trim().isNotEmpty).join(', ');

      return _AddressParts(
        display: display.isEmpty ? 'Address nahi mila' : display,
        addressLine: addressLine.isEmpty ? 'N/A' : addressLine,
        city: city,
        state: state,
        countryCode: countryCode,
      );
    } catch (e) {
      return _AddressParts(
        display: 'Address fetch mein error: $e',
        addressLine: 'N/A',
        city: 'N/A',
        state: 'N/A',
        countryCode: 'N/A',
      );
    }
  }

  // ignore: library_private_types_in_public_api
  void debugPrintAddress(LatLng latLng, _AddressParts parts) {
    // ignore: avoid_print
    print('📍 lat=${latLng.latitude}, lng=${latLng.longitude}');
    // ignore: avoid_print
    print('🏠 ${parts.display}');
  }
}

class _AddressParts {
  final String display;
  final String addressLine;
  final String city;
  final String state;
  final String countryCode;

  _AddressParts({
    required this.display,
    required this.addressLine,
    required this.city,
    required this.state,
    required this.countryCode,
  });
}
