import 'package:latlong2/latlong.dart';

abstract class LocationEvent {}

class LoadCurrentLocationEvent extends LocationEvent {}

// screen khulte hi pehle yeh call hoga - dekhta hai ke pehle se
// location DB mein hai ya nahi. Nahi hai to khud GPS location le lega
class LoadSavedLocationEvent extends LocationEvent {}

class MapMoveEndEvent extends LocationEvent {
  final LatLng finalCenter;

  MapMoveEndEvent(this.finalCenter);
}

class SearchLocationEvent extends LocationEvent {
  final String query;

  SearchLocationEvent(this.query);
}

// Save button dabane par - Bloc apni current state se data uthata hai,
// isliye is event mein kuch pass karne ki zaroorat nahi
class SaveLocationEvent extends LocationEvent {}
