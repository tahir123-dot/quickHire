import '../entity/service_provider_entity.dart';
import '../model/service_provider_model.dart';

class ServiceProviderMapper {
  static ServiceProviderEntity toEntity(ServiceProviderModel model) {
    return ServiceProviderEntity(
      serviceProviderId: model.serviceProviderId,
      userId: model.userId,
      categoryId: model.categoryId,
      profileName: model.profileName,
      profileImage: model.profileImage,
      profileBanner: model.profileBanner,
      profileDescription: model.profileDescription,
      businessPhone: model.businessPhone,
      goldenBadge: model.goldenBadge,
    );
  }
}