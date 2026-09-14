// use this

import 'package:dio/dio.dart';
import 'package:mobile/provider/data/api/api.dart';
import 'package:mobile/provider/data/model/availability_model.dart';
import 'package:mobile/provider/data/model/provider_booking_model.dart';
import 'package:mobile/provider/data/model/service_model.dart';
import 'package:mobile/provider/data/model/sub_category_model.dart';
import 'package:mobile/provider/data/model/team_member_model.dart';

class ProviderDataSources {
  final Dio dio;

  ProviderDataSources(this.dio);

  // create provider profile
  Future<Response> createProviderProfile(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(
        ProviderApiEndPoints.providerProfile,
        data: data,
      );

      return response;
    } on DioException catch (e) {
      throw Exception("Failed to create provider profile: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // create business details
  Future<Response> createBusinessDetails(FormData formData) async {
    try {
      final response = await dio.patch(
        ProviderApiEndPoints.businessDetails,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
      return response;
    } on DioException catch (e) {
      throw Exception("Failed to create business details: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // banner image upload
  Future<Response> createBannerImage(FormData formData) async {
    try {
      final response = await dio.patch(
        ProviderApiEndPoints.banner,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
      return response;
    } on DioException catch (e) {
      throw Exception("Failed to upload banner: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // get sub category for services for add service with the link or sub category

  Future<List<SubCategoryModel>> getSubCategories() async {
    try {
      final response = await dio.get(ProviderApiEndPoints.getSubCategories);

      final List data = response.data['data'];
      return data.map((json) => SubCategoryModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception("Failed to fetch sub categories: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // add service
  Future<Response> addService(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(
        ProviderApiEndPoints.addService,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      throw Exception("Failed to add service: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // get all services by provider id through token
  Future<List<ServiceModel>> getProviderServices() async {
    try {
      final response = await dio.get(ProviderApiEndPoints.addService);
      final List data = response.data['data'];
      return data.map((json) => ServiceModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception("Failed to fetch services: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // delete service
  Future<Response> deleteService(String serviceId) async {
    try {
      final response = await dio.delete(
        "${ProviderApiEndPoints.addService}/$serviceId",
      );
      return response;
    } on DioException catch (e) {
      throw Exception("Failed to delete service: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // get all team member of srevice providers
  Future<List<TeamMemberModel>> getTeamList() async {
    try {
      final response = await dio.get(ProviderApiEndPoints.teamList);
      final List data = response.data['data'];
      return data.map((json) => TeamMemberModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception("Failed to fetch team: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // delete team member
  Future<Response> deleteTeamMember(String teamMemberId) async {
    try {
      final response = await dio.delete(
        "${ProviderApiEndPoints.team}/$teamMemberId",
      );
      return response;
    } on DioException catch (e) {
      throw Exception("Failed to delete member: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // add availability
  Future<Response> addAvailability(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(
        ProviderApiEndPoints.availability,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      throw Exception("Failed to add availability: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // get availability
  Future<AvailabilityModel?> getAvailability() async {
    try {
      final response = await dio.get(ProviderApiEndPoints.availability);

      if (response.data['success'] == false) {
        return null;
      }

      return AvailabilityModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw Exception("Failed to fetch availability: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // fetch all bookings
  Future<List<ProviderBookingModel>> getProviderBookings() async {
    try {
      final response = await dio.get(ProviderApiEndPoints.providerBooking);
      final List<dynamic> data = response.data['data'];
      return data.map((json) => ProviderBookingModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception("Failed to fetch bookings: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // update booking status
  Future<void> updateBookingStatus(String bookingId, String status) async {
    try {
      await dio.patch(
        '${ProviderApiEndPoints.bookingStatus}/$bookingId/status',
        data: {'status': status},
      );
    } on DioException catch (e) {
      throw Exception("Failed to update booking: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
