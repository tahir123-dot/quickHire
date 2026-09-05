import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/utils/storage.dart';
// apna sahi path lagao

class DioClient {
  static Dio getDio(IStorageService storageService) {
    // storageService pass karo
    final dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL']!,
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 60),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final requiresAuth = options.extra["requiresAuth"] ?? true;

          if (requiresAuth) {
            final token = await storageService.getToken();
            if (token != null) {
              options.headers["Authorization"] = "Bearer $token";
            }
          }
          return handler.next(options);
        },
        onError: (e, handler) async {
          if (e.response?.statusCode == 401) {
            await storageService.deleteToken();
            // navigate to login
          }
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}
