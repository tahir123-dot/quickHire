// dto/service_provider_dto.dart

// Step 1 — Category
import 'dart:io';

import 'package:dio/dio.dart';

class InitServiceProviderDto {
  final String userId;
  final String categoryId;

  InitServiceProviderDto({required this.userId, required this.categoryId});

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'category_id': categoryId,
  };
}

// Step 2 — Business Details
class UpdateBusinessDetailsDto {
  final String profileName;
  final String profileDescription;
  final String businessPhone;
  final File? profileImage;

  UpdateBusinessDetailsDto({
    required this.profileName,
    required this.profileDescription,
    required this.businessPhone,
    this.profileImage,
  });

  // FormData banao - multipart ke liye
  Future<FormData> toFormData() async {
    final map = <String, dynamic>{
      'profile_name': profileName,
      'profile_description': profileDescription,
      'business_phone': businessPhone,
    };

    if (profileImage != null) {
      map['profile_image'] = await MultipartFile.fromFile(
        profileImage!.path,
        filename: profileImage!.path.split('/').last,
      );
    }

    return FormData.fromMap(map);
  }
}

// Step 3 — Banner
class UpdateBannerDto {
  final File profileBanner;

  UpdateBannerDto({required this.profileBanner});

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'profile_banner': await MultipartFile.fromFile(
        profileBanner.path,
        filename: profileBanner.path.split('/').last,
      ),
    });
  }
}

// Step 4 — Add Service
class AddServiceDto {
  final String serviceProviderId;
  final String categoryServiceId;
  final String serviceName;
  final int serviceDuration;
  final double servicePrice;

  AddServiceDto({
    required this.serviceProviderId,
    required this.categoryServiceId,
    required this.serviceName,
    required this.serviceDuration,
    required this.servicePrice,
  });

  Map<String, dynamic> toJson() => {
    'service_provider_Id': serviceProviderId,
    'category_serviceId': categoryServiceId,
    'service_name': serviceName,
    'service_duration': serviceDuration,
    'service_price': servicePrice,
  };
}

class AddAvailabilityDto {
  final String ownerId;
  final String ownerType;
  final List<String> days;
  final String startTime;
  final String endTime;
  final int slotDuration;
  final String? breakStart;
  final String? breakEnd;

  AddAvailabilityDto({
    required this.ownerId,
    required this.ownerType,
    required this.days,
    required this.startTime,
    required this.endTime,
    required this.slotDuration,
    this.breakStart,
    this.breakEnd,
  });

  Map<String, dynamic> toJson() => {
    'owner_id': ownerId,
    'ownerType': ownerType,
    'days': days,
    'start_time': startTime,
    'end_time': endTime,
    'slot_duration': slotDuration,
    'break_start': breakStart,
    'break_end': breakEnd,
  };
}
