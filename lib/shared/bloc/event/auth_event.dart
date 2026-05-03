abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class SignupEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignupEvent(this.name, this.email, this.password);
}

class OtpVerificationEvent extends AuthEvent {
  final String email;
  final String otp;

  OtpVerificationEvent(this.email, this.otp);
}

class ResendOtpEvent extends AuthEvent {
  final String email;

  ResendOtpEvent(this.email);
}
