// use this

import 'package:dio/dio.dart';
import 'package:mobile/provider/data/api/api.dart';
import 'package:mobile/provider/data/model/sub_category_model.dart';

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
  Future<Response> createBusinessDetails(FormData formData, String id) async {
    try {
      final response = await dio.patch(
        "${ProviderApiEndPoints.businessDetails}/$id",
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
  Future<Response> createBannerImage(FormData formData, String id) async {
    try {
      final response = await dio.patch(
        "${ProviderApiEndPoints.businessDetails}/$id/banner-image",
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

  Future<List<SubCategoryModel>> getSubCategories(String categoryId) async {
    try {
      final response = await dio.get(
        "${ProviderApiEndPoints.getSubCategories}/$categoryId",
      );

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
}
