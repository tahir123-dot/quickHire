import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class IStorageService {
  Future<void> saveEmail(String email);
  Future<String?> getEmail();

  Future<void> saveToken(String token);
  Future<String?> getToken();
}

class StorageService implements IStorageService {
  final FlutterSecureStorage _storage;

  StorageService(this._storage);

  // email save
  @override
  Future<void> saveEmail(String email) async {
    await _storage.write(key: "email", value: email);
  }

  @override
  Future<String?> getEmail() async {
    return await _storage.read(key: "email");
  }

  // token save

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: "token", value: token);
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: "token");
  }
}
