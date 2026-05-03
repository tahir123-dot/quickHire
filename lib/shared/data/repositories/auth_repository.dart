import 'package:mobile/shared/data/dto/login.dart';
import 'package:mobile/shared/data/dto/otp.dart';
import 'package:mobile/shared/data/dto/signup.dart';
import 'package:mobile/shared/data/entity/entity.dart';

abstract class AuthRepository {
  // signup
  Future<User> signup(SignupDto dto);

  // verify otp
  Future<bool> verifyOtp(OtpDto dto);

  // resend otp
  Future<void> resendOtp(String email);

  // login
  Future<bool> login(LoginDto dto);

  // forget password
  Future<void> forgetPassword(String email);

  // user
  Future<void> updateUser(String userId, Map<String, dynamic> userData);

  // service provider
  Future<void> updateServiceProvider(
    String userId,
    Map<String, dynamic> userData,
  );

  // team
  Future<void> updateTeam(String teamId, Map<String, dynamic> userData);

  // switch role
  Future<void> switchRole(String userId, String newRole);
}
