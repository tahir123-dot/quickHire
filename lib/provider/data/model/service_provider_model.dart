// model/service_provider_model.dart

class ServiceProviderModel {
  final String? serviceProviderId;
  final String? userId;
  final String? categoryId;
  final String? profileName;
  final String? profileImage;
  final String? profileBanner;
  final String? profileDescription;
  final String? businessPhone;
  final bool? goldenBadge;

  ServiceProviderModel({
    this.serviceProviderId,
    this.userId,
    this.categoryId,
    this.profileName,
    this.profileImage,
    this.profileBanner,
    this.profileDescription,
    this.businessPhone,
    this.goldenBadge,
  });

  factory ServiceProviderModel.fromJson(Map<String, dynamic> json) {
    return ServiceProviderModel(
      serviceProviderId: json['_id'],
      userId: json['userId'],
      categoryId: json['category_id'],
      profileName: json['profile_name'],
      profileImage: json['profile_image'],
      profileBanner: json['profile_banner'],
      profileDescription: json['profile_description'],
      businessPhone: json['business_phone'],
      goldenBadge: json['goldenBadge'],
    );
  }
}