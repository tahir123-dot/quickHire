// use this

import 'package:dio/dio.dart';
import 'package:mobile/provider/data/api/api.dart';

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
  Future<Response> createBusinessDetails(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(
        ProviderApiEndPoints.businessDetails,
        data: data,
      );
      return response;
    } on DioException catch (e) {
      throw Exception("Failed to create business details: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // create banner image
  Future<Response> createBannerImage(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(ProviderApiEndPoints.banner, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception("Failed to create banner image: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
