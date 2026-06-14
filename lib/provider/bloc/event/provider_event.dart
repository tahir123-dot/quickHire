abstract class ProviderProfileEvent {}

// create provider profile
class CreateProviderProfileEvent extends ProviderProfileEvent {
  final String userId;
  final String categoryId;

  CreateProviderProfileEvent({required this.userId, required this.categoryId});
}

// create provider profile business details
class ProviderBusinessDetailsEvent extends ProviderProfileEvent {
  final String providerId;
  final String businessName;
  final String imageUrl;
  final String businessDescription;

  ProviderBusinessDetailsEvent({
    required this.providerId,
    required this.businessName,
    required this.imageUrl,
    required this.businessDescription,
  });
}

// create provider profile banner image
class ProviderBannerImageEvent extends ProviderProfileEvent {
  final String providerId;
  final String bannerImageUrl;

  ProviderBannerImageEvent({
    required this.providerId,
    required this.bannerImageUrl,
  });
}
