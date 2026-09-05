class ProviderInfoModel {
  final String id;
  final String name;
  final String profileImage;
  final String? location;
  final String type;
  final String description;

  ProviderInfoModel({
    required this.id,
    required this.name,
    required this.profileImage,
    this.location,
    required this.type,
    required this.description,
  });

  factory ProviderInfoModel.fromJson(Map<String, dynamic> json) {
    return ProviderInfoModel(
      id: json['id'],
      name: json['name'],
      profileImage: json['profileImage'],
      location: json['location'],
      type: json['type'],
      description: json['description'],
    );
  }
}
