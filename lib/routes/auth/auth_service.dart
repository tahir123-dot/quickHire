import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobile/utils/storage.dart';

class AuthService {
  static Map<String, dynamic>? _user;

  static Future<void> init(IStorageService storage) async {
    final token = await storage.getToken();

    if (token != null && !JwtDecoder.isExpired(token)) {
      _user = JwtDecoder.decode(token);
    } else {
      _user = null;
    }
  }

  static bool get isLoggedIn => _user != null;

  static String? get userId => _user?['user_Id'];
  static String? get role => _user?['activeRole'];
}
