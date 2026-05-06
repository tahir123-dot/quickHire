import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService {
  static Map<String, dynamic>? _user;

  static Future<void> setToken(String token) async {
    _user = JwtDecoder.decode(token);
  }

  static void clear() {
    _user = null;
  }

  static bool get isLoggedIn => _user != null;

  static String? get userId => _user?['user_Id'];
  static String? get role => _user?['activeRole'];
}
