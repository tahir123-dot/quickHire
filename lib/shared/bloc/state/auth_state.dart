abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

// ================= Login =================
class LoginSuccess extends AuthState {
  final String message;
  LoginSuccess({required this.message});
}

class LogoutSuccess extends AuthState {
  final String message;
  LogoutSuccess({required this.message});
}

// ================= SIGNUP =================
class SignupSuccess extends AuthState {
  final String message;
  SignupSuccess({required this.message});
}

// ================= OTP VERIFY =================
class OtpVerifySuccess extends AuthState {
  final String message;

  OtpVerifySuccess({required this.message});
}

// ================= RESEND OTP =================
class ResendOtpSuccess extends AuthState {
  final String message;

  ResendOtpSuccess({required this.message});
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

// user account creation success
class UserAccountCreationSuccess extends AuthState {
  final String message;

  UserAccountCreationSuccess({required this.message});
}

// service provider account creation success
class ServiceProviderAccountCreationSuccess extends AuthState {
  final String message;

  ServiceProviderAccountCreationSuccess({required this.message});
}

// team account creation success
class TeamAccountCreationSuccess extends AuthState {
  final String message;

  TeamAccountCreationSuccess({required this.message});
}
