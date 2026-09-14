class ServiceItemModel {
  final String id;
  final String name;
  final double price;
  final int duration;

  ServiceItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.duration,
  });

  factory ServiceItemModel.fromJson(Map<String, dynamic> json) {
    return ServiceItemModel(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num)
          .toDouble(), // int ya double dono handle karega
      duration: json['duration'],
    );
  }
}

// ProviderProfileView class to represent the provider profile data
class ProviderProfileView {
  final String id;
  final String name;
  final String profileImage;
  final String bannerImage;
  final String description;
  final double rating;
  final List<ServiceItemModel> services;

  ProviderProfileView({
    required this.id,
    required this.name,
    required this.profileImage,
    required this.bannerImage,
    required this.description,
    required this.rating,
    required this.services,
  });

  factory ProviderProfileView.fromJson(Map<String, dynamic> json) {
    return ProviderProfileView(
      id: json['id'],
      name: json['name'],
      profileImage: json['profileImage'],
      bannerImage: json['bannerImage'],
      description: json['description'],
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      services: (json['services'] as List)
          .map((item) => ServiceItemModel.fromJson(item))
          .toList(),
    );
  }
}
