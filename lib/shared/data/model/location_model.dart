import 'package:mobile/enum/owner_type.dart';

class LocationResponseModel {
  final String ownerId;
  final LocationOwnerType ownerType;
  final String countryCode;
  final String addressLine;
  final String city;
  final String state;
  final double latitude;
  final double longitude;
  final String h3Index;

  LocationResponseModel({
    required this.ownerId,
    required this.ownerType,
    required this.countryCode,
    required this.addressLine,
    required this.city,
    required this.state,
    required this.latitude,
    required this.longitude,
    required this.h3Index,
  });

  factory LocationResponseModel.fromJson(Map<String, dynamic> json) {
    final coordinates = json['location']['coordinates'] as List<dynamic>;

    return LocationResponseModel(
      ownerId: json['ownerId'] as String,
      ownerType: LocationOwnerType.values.firstWhere(
        (e) => e.name == json['ownerType'],
        orElse: () => LocationOwnerType.Customer,
      ),
      countryCode: json['countryCode'] as String,
      addressLine: json['address_line'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      longitude: (coordinates[0] as num).toDouble(),
      latitude: (coordinates[1] as num).toDouble(),
      h3Index: json['h3Index'] as String? ?? '',
    );
  }
}
