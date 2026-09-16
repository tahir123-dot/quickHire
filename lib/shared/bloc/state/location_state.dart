import 'package:latlong2/latlong.dart';
import 'package:mobile/shared/data/entity/location_entity.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final LatLng selectedLocation;
  final String address; // UI mein dikhane wala combined string

  // backend ko save karte waqt yeh alag alag chahiye
  final String addressLine;
  final String city;
  final String state;
  final String countryCode;

  final bool recenterCamera;
  final bool hasExistingLocation; // true = update, false = create

  LocationLoaded({
    required this.selectedLocation,
    required this.address,
    required this.addressLine,
    required this.city,
    required this.state,
    required this.countryCode,
    this.recenterCamera = false,
    this.hasExistingLocation = false,
  });
}

// Save API call chal rahi hai
class LocationSaving extends LocationState {}

// Save successful
class LocationSaved extends LocationState {
  final LocationEntity location;

  LocationSaved(this.location);
}

class LocationError extends LocationState {
  final String message;

  LocationError(this.message);
}
