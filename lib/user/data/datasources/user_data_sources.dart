import 'package:dio/dio.dart';
import 'package:mobile/provider/data/model/team_member_model.dart';
import 'package:mobile/user/data/api/user_api.dart';
import 'package:mobile/user/data/model/category_model.dart';
import 'package:mobile/user/data/model/customer_booking_model.dart';
import 'package:mobile/user/data/model/provider_info.dart';
import 'package:mobile/user/data/model/provider_profile.dart';
import 'package:mobile/user/data/model/team_availability_model.dart';

class UserDataSources {
  final Dio dio;

  UserDataSources(this.dio);

  Future<List<CategoryModel>> getCategories() async {
    final response = await dio.get(
      UserApiEndPoints.getCategory,
      options: Options(extra: {"requiresAuth": false}),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['data'];
      return data.map((item) => CategoryModel.fromJson(item)).toList();
    } else {
      throw Exception('Categories fetch nahi hui');
    }
  }

  Future<List<ProviderInfoModel>> getProvidersByCategory(
    String categoryId,
  ) async {
    final response = await dio.get(
      UserApiEndPoints.getProvidersByCategory,
      queryParameters: {'categoryId': categoryId},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['data'];
      return data.map((item) => ProviderInfoModel.fromJson(item)).toList();
    } else {
      throw Exception('Providers fetch nahi hui');
    }
  }

  // fetch provider profile by id
  Future<ProviderProfileView> getProviderProfileById(String providerId) async {
    try {
      final response = await dio.get(
        '${UserApiEndPoints.getProviderProfileById}/$providerId',
      );

      print('Response data: ${response.data}'); // Debugging line

      return ProviderProfileView.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw Exception("Failed to fetch provider profile: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // fetch provider team members by provider id
  Future<List<TeamMemberModel>> getProviderTeamMembers(
    String providerId,
  ) async {
    try {
      final response = await dio.get(
        '${UserApiEndPoints.getProviderTeamMembers}/$providerId',
      );

      final List<dynamic> data = response.data['data'];
      return data.map((item) => TeamMemberModel.fromJson(item)).toList();
    } on DioException catch (e) {
      throw Exception("Failed to fetch provider team members: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // screen 4 get availability by owner id
  Future<TeamAvailabilityModel?> getTeamMemberSlotsByDay(
    String ownerId,
    String date,
  ) async {
    try {
      final response = await dio.get(
        '${UserApiEndPoints.getTeamMemberAvailability}/$ownerId',
        queryParameters: {'date': date},
      );

      final data = response.data['data'];

      if (data == null) {
        return null;
      }

      return TeamAvailabilityModel.fromJson(data);
    } on DioException catch (e) {
      throw Exception("Failed to fetch provider team members: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // screen 5 submit booking
  Future<String> submitBooking(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(
        UserApiEndPoints.submitBookingRequest,
        data: data,
      );
      return response
          .data['data']['id']; // backend jo booking-id bheje, wo nikaल lo
    } on DioException catch (e) {
      throw Exception("Failed to submit booking: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // navigatoin booking screen list
  Future<List<CustomerBookingModel>> getCustomerBookings() async {
    try {
      final response = await dio.get(UserApiEndPoints.customerBookings);
      final List<dynamic> data = response.data['data'];
      return data.map((json) => CustomerBookingModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception("Failed to fetch bookings: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // cancel booking by customer
  Future<void> cancelBooking(String bookingId) async {
    try {
      await dio.patch('${UserApiEndPoints.bookingCancel}/$bookingId/cancel');
    } on DioException catch (e) {
      throw Exception("Failed to cancel booking: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
