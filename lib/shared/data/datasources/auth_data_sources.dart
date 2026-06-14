import 'package:dio/dio.dart';
import 'package:mobile/shared/data/api/api.dart';
import 'package:mobile/shared/data/dto/login.dart';
import 'package:mobile/shared/data/dto/otp.dart';
import 'package:mobile/shared/data/dto/signup.dart';
import 'package:mobile/shared/data/model/otp_model.dart';
import 'package:mobile/shared/data/model/signup_model.dart';

class AuthDataSources {
  final Dio dio;

  AuthDataSources(this.dio);

  // login
  Future<VerifyOtpResponseModel> login(LoginDto dto) async {
    try {
      final response = await dio.post(
        PublicApiEndPoints.login,
        data: dto.toJson(),
      );
      print("Login response: ${response.data}");
      return VerifyOtpResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("Login failed: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // signup
  Future<SignupResponseModel> signup(SignupDto dto) async {
    try {
      final response = await dio.post(
        PublicApiEndPoints.signup,
        data: dto.toJson(),
      );

      return SignupResponseModel.fromJson(response.data['response']);
    } on DioException catch (e) {
      throw Exception("Signup failed: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // verify otp
  Future<VerifyOtpResponseModel> verifyOtp(OtpDto dto) async {
    try {
      final response = await dio.post(
        PublicApiEndPoints.verifyOTP,
        data: dto.toJson(),
      );

      return VerifyOtpResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("OTP verification failed: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // resend otp
  Future<void> resendOtp(String email) async {
    try {
      await dio.post(PublicApiEndPoints.resendOTP, data: {"email": email});
    } on DioException catch (e) {
      throw Exception("Resend OTP failed: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // create user account
  Future<ResponseModelToken> createUserAccount(String userId) async {
    try {
      final response = await dio.post(
        PublicApiEndPoints.userCreate,
        data: {"userId": userId},
      );
      return ResponseModelToken.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("Create user account failed: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // create service provider account
  Future<ResponseModelToken> createServiceProviderAccount(String userId) async {
    try {
      final response = await dio.post(
        PublicApiEndPoints.serviceProivderCreate,
        data: {"userId": userId},
      );
      return ResponseModelToken.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("Create service provider account failed: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // create team account
  Future<ResponseModelToken> createTeamAccount(String userId) async {
    try {
      final response = await dio.post(
        PublicApiEndPoints.teamCreate,
        data: {"userId": userId},
      );
      return ResponseModelToken.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("Create team account failed: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
