// entity/service_provider_entity.dart

class ServiceProviderEntity {
  final String? serviceProviderId;
  final String? userId;
  final String? categoryId;
  final String? profileName;
  final String? profileImage;
  final String? profileBanner;
  final String? profileDescription;
  final String? businessPhone;
  final bool? goldenBadge;

  ServiceProviderEntity({
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
}
