class LocationDto {
  final String countryCode;
  final String addressLine;
  final String city;
  final String state;
  final double latitude;
  final double longitude;

  LocationDto({
    required this.countryCode,
    required this.addressLine,
    required this.city,
    required this.state,
    required this.latitude,
    required this.longitude,
  });

  // ownerId aur ownerType Flutter se nahi jate - backend token se
  // userId decode karke khud role/ownerType nikal leta hai
  Map<String, dynamic> toJson() {
    return {
      'countryCode': countryCode,
      'address_line': addressLine,
      'city': city,
      'state': state,
      'location': {
        'type': 'Point',
        'coordinates': [longitude, latitude], // backend order: [lng, lat]
      },
    };
  }
}

/// update ke liye - saari fields optional, jo diya jaye wahi bhejo
class UpdateLocationDto {
  final String? countryCode;
  final String? addressLine;
  final String? city;
  final String? state;
  final double? latitude;
  final double? longitude;

  UpdateLocationDto({
    this.countryCode,
    this.addressLine,
    this.city,
    this.state,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (countryCode != null) json['countryCode'] = countryCode;
    if (addressLine != null) json['address_line'] = addressLine;
    if (city != null) json['city'] = city;
    if (state != null) json['state'] = state;
    if (latitude != null && longitude != null) {
      json['location'] = {
        'type': 'Point',
        'coordinates': [longitude, latitude],
      };
    }
    return json;
  }
}
