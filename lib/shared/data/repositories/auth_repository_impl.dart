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
    await storage.saveToken(response.response.token);
    return response.response.success;
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
    await storage.saveToken(response.response.token);
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
  Future<void> updateServiceProvider(
    String userId,
    Map<String, dynamic> userData,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateTeam(String teamId, Map<String, dynamic> userData) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(String userId, Map<String, dynamic> userData) {
    throw UnimplementedError();
  }
}
