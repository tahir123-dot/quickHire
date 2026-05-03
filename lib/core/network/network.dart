import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  static Dio getDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL']!,
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 60),
      ),
    );

    // Interceptor (important 🔥)
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final requiresAuth = options.extra["requiresAuth"] ?? true;

          if (requiresAuth) {
            options.headers["Authorization"] = "Bearer YOUR_TOKEN";
          }
          return handler.next(options);
        },
        onError: (e, handler) {
          print("Error: ${e.message}");
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}
