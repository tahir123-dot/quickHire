// dto/service_provider_dto.dart

// Step 1 — Category
class InitServiceProviderDto {
  final String userId;
  final String categoryId;

  InitServiceProviderDto({
    required this.userId,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'category_id': categoryId,
  };
}

// Step 2 — Business Details
class UpdateBusinessDetailsDto {
  final String serviceProviderId;
  final String profileName;
  final String profileDescription;
  final String businessPhone;

  UpdateBusinessDetailsDto({
    required this.serviceProviderId,
    required this.profileName,
    required this.profileDescription,
    required this.businessPhone,
  });

  Map<String, dynamic> toJson() => {
    'serviceProviderId': serviceProviderId,
    'profile_name': profileName,
    'profile_description': profileDescription,
    'business_phone': businessPhone,
  };
}

// Step 3 — Banner
class UpdateBannerDto {
  final String serviceProviderId;

  UpdateBannerDto({required this.serviceProviderId});

  Map<String, dynamic> toJson() => {
    'serviceProviderId': serviceProviderId,
  };
}