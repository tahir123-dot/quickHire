class Location {
  final String type;
  final List<double> coordinates;

  Location({required this.type, required this.coordinates});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List)
          .map((e) => (e as num).toDouble())
          .toList(),
    );
  }
}

class ProviderInfoModel {
  final String id;
  final String name;
  final String profileImage;
  final Location location;
  final String distance;
  final String type;
  final String description;

  ProviderInfoModel({
    required this.id,
    required this.name,
    required this.profileImage,
    required this.location,
    required this.distance,
    required this.type,
    required this.description,
  });

  factory ProviderInfoModel.fromJson(Map<String, dynamic> json) {
    return ProviderInfoModel(
      id: json['id'] as String,
      name: json['name'] as String,
      profileImage: json['profileImage'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      distance: json['distance'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
    );
  }
}
