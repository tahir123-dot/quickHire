import 'package:mobile/enum/owner_type.dart';

class LocationEntity {
  final String ownerId;
  final LocationOwnerType ownerType;
  final String countryCode;
  final String addressLine;
  final String city;
  final String state;
  final double latitude;
  final double longitude;
  final String? h3Index;

  LocationEntity({
    required this.ownerId,
    required this.ownerType,
    required this.countryCode,
    required this.addressLine,
    required this.city,
    required this.state,
    required this.latitude,
    required this.longitude,
    this.h3Index,
  });
}
