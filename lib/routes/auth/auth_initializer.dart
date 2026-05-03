import 'package:mobile/routes/auth/auth_service.dart';
import 'package:mobile/utils/storage.dart';

class AuthInitializer {
  static Future<void> init(IStorageService storage) async {
    await AuthService.init(storage);
  }
}
