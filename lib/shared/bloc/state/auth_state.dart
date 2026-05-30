import 'package:mobile/routes/auth/role_enum.dart';

abstract class AuthState {}

/// ================= INITIAL =================

class AuthInitial extends AuthState {}

/// ================= LOADING =================

class AuthLoading extends AuthState {}

/// ================= AUTH SESSION =================

class Authenticated extends AuthState {
  final String token;
  final UserRole role;

  Authenticated({required this.token, required this.role});
}

class Unauthenticated extends AuthState {}

/// ================= SIGNUP =================

class SignupSuccess extends AuthState {
  final String message;

  SignupSuccess({required this.message});
}

/// ================= OTP VERIFY =================

class OtpVerifySuccess extends AuthState {
  final String message;

  OtpVerifySuccess({required this.message});
}

/// ================= RESEND OTP =================

class ResendOtpSuccess extends AuthState {
  final String message;

  ResendOtpSuccess({required this.message});
}

/// ================= ACCOUNT CREATION =================

class UserAccountCreationSuccess extends AuthState {
  final String message;

  UserAccountCreationSuccess({required this.message});
}

class ServiceProviderAccountCreationSuccess extends AuthState {
  final String message;

  ServiceProviderAccountCreationSuccess({required this.message});
}

class TeamAccountCreationSuccess extends AuthState {
  final String message;

  TeamAccountCreationSuccess({required this.message});
}

/// ================= ERROR =================

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
