import 'package:mobile/routes/auth/auth_service.dart';
import 'package:mobile/shared/data/datasources/auth_data_sources.dart';
import 'package:mobile/shared/data/dto/login.dart';
import 'package:mobile/shared/data/dto/otp.dart';
import 'package:mobile/shared/data/dto/signup.dart';
import 'package:mobile/shared/data/entity/entity.dart';
import 'package:mobile/shared/data/mapper/mapper.dart';
import 'package:mobile/shared/data/model/otp_model.dart';
import 'package:mobile/shared/data/model/signup_model.dart';
import 'package:mobile/shared/data/repositories/auth_repository.dart';
import 'package:mobile/utils/storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSources remote;
  final IStorageService storage;
  AuthRepositoryImpl(this.remote, this.storage);

  // login
  @override
  Future<bool> login(LoginDto dto) async {
    final VerifyOtpResponseModel response = await remote.login(dto);
    final token = response.response.token;

    await storage.saveToken(token);
    await AuthService.setToken(token);

    return response.response.success;
  }

  // logout
  @override
  Future<void> deleteToken() async {
    await storage.deleteToken();
  }

  // signup
  @override
  Future<User> signup(SignupDto dto) async {
    final SignupResponseModel model = await remote.signup(dto);
    await storage.saveEmail(model.email);
    return UserMapper.toEntity(model);
  }

  // verify otp
  @override
  Future<bool> verifyOtp(OtpDto dto) async {
    final VerifyOtpResponseModel response = await remote.verifyOtp(dto);
    final token = response.response.token;

    await storage.saveToken(token);
    await AuthService.setToken(token);

    return response.response.success;
  }

  @override
  Future<void> resendOtp(String email) async {
    await remote.resendOtp(email);
  }

  @override
  Future<void> forgetPassword(String email) {
    throw UnimplementedError();
  }

  @override
  Future<void> switchRole(String userId, String newRole) {
    throw UnimplementedError();
  }

  @override
  Future<bool> createServiceProviderAccount(String userId) async {
    final ResponseModelToken response = await remote
        .createServiceProviderAccount(userId);
    await storage.saveToken(response.token);
    return response.success;
  }

  @override
  Future<bool> createTeamAccount(String userId) async {
    final ResponseModelToken response = await remote.createTeamAccount(userId);
    await storage.saveToken(response.token);
    return response.success;
  }

  @override
  Future<bool> createUserAccount(String userId) async {
    final ResponseModelToken response = await remote.createUserAccount(userId);
    await storage.saveToken(response.token);
    return response.success;
  }
}
