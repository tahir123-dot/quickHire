import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

abstract class IStorageService {
  // Email
  Future<void> saveEmail(String email);
  Future<String?> getEmail();

  // Token
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();

  // User Role
  Future<void> saveUserRole(String role);
  Future<String?> getUserRole();
}

class StorageService implements IStorageService {
  final FlutterSecureStorage _storage;

  StorageService(this._storage);

  // Keys
  static const _keyEmail = 'user_email';
  static const _keyToken = 'auth_token';
  static const _keyRefreshToken = 'refresh_token';
  static const _keyUserRole = 'user_role';
  static const _keyUserId = 'user_id';
  static const _keyUserName = 'user_name';
  static const _keyUserData = 'user_data';

  //  Email
  @override
  Future<void> saveEmail(String email) async {
    await _storage.write(key: _keyEmail, value: email);
  }

  @override
  Future<String?> getEmail() async {
    return await _storage.read(key: _keyEmail);
  }

  // Token

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: _keyToken, value: token);

    // decode token
    try {
      final decoded = JwtDecoder.decode(token);

      final role = decoded['activeRole'];
      if (role != null) {
        await saveUserRole(role);
      }
    } catch (e) {
      print("Token decode error: $e");
    }
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: _keyToken);
  }

  // User Role

  @override
  Future<String?> getUserRole() async {
    return await _storage.read(key: _keyUserRole);
  }

  @override
  Future<void> saveUserRole(String role) async {
    await _storage.write(key: _keyUserRole, value: role);
  }
}
