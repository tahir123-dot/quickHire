abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

// ================= SIGNUP =================
class LoginSuccess extends AuthState {
  final String message;
  LoginSuccess({required this.message});
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
