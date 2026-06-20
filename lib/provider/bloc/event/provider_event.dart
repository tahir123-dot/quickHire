import 'dart:io';

abstract class ProviderProfileEvent {}

// create provider profile
class CreateProviderProfileEvent extends ProviderProfileEvent {
  final String userId;
  final String categoryId;

  CreateProviderProfileEvent({required this.userId, required this.categoryId});
}

// create provider profile business details
class ProviderBusinessDetailsEvent extends ProviderProfileEvent {
  final String businessName;
  final String businessDescription;
  final String businessPhone;
  final File? profileImage;

  ProviderBusinessDetailsEvent({
    required this.businessName,
    required this.businessDescription,
    required this.businessPhone,
    this.profileImage,
  });
}

// create provider profile banner image
class ProviderBannerImageEvent extends ProviderProfileEvent {
  final File bannerImage; // ✅ File type

  ProviderBannerImageEvent({required this.bannerImage});
}

// get sub categoires
class FetchSubCategoriesEvent extends ProviderProfileEvent {
  final String categoryId;
  FetchSubCategoriesEvent({required this.categoryId});
}

// add service
class AddServiceEvent extends ProviderProfileEvent {
  final String categoryServiceId;
  final String serviceName;
  final int serviceDuration;
  final double servicePrice;

  AddServiceEvent({
    required this.categoryServiceId,
    required this.serviceName,
    required this.serviceDuration,
    required this.servicePrice,
  });
}

// get provider services
class FetchProviderServicesEvent extends ProviderProfileEvent {
  final String serviceProviderId;
  FetchProviderServicesEvent({required this.serviceProviderId});
}

class DeleteServiceEvent extends ProviderProfileEvent {
  final String serviceId;
  DeleteServiceEvent({required this.serviceId});
}
