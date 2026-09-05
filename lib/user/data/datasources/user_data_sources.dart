import 'package:dio/dio.dart';
import 'package:mobile/user/data/api/user_api.dart';
import 'package:mobile/user/data/model/category_model.dart';
import 'package:mobile/user/data/model/provider_info.dart';

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
}
