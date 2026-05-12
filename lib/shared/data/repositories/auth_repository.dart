import 'package:mobile/shared/data/dto/login.dart';
import 'package:mobile/shared/data/dto/otp.dart';
import 'package:mobile/shared/data/dto/signup.dart';
import 'package:mobile/shared/data/entity/entity.dart';
import 'package:mobile/shared/data/model/otp_model.dart';

abstract class AuthRepository {
  // signup
  Future<User> signup(SignupDto dto);

  // verify otp
  Future<VerifyOtpResponseModel> verifyOtp(OtpDto dto);

  // resend otp
  Future<void> resendOtp(String email);

  // login
  Future<VerifyOtpResponseModel> login(LoginDto dto);

  // logout
  Future<void> deleteToken();

  // forget password
  Future<void> forgetPassword(String email);

  // create user account
  Future<bool> createUserAccount(String userId);

  // create service provider account
  Future<bool> createServiceProviderAccount(String userId);

  // create team account
  Future<bool> createTeamAccount(String userId);

  // switch role
  Future<void> switchRole(String userId, String newRole);
}
