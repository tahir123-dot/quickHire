abstract class AuthEvent {}

// login event
class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

// signup event
class SignupEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String role;

  SignupEvent(this.name, this.email, this.password, this.role);
}

// otp verification event
class OtpVerificationEvent extends AuthEvent {
  final String email;
  final String otp;

  OtpVerificationEvent(this.email, this.otp);
}

// resend otp event
class ResendOtpEvent extends AuthEvent {
  final String email;

  ResendOtpEvent(this.email);
}

// lgout event

class LogoutEvent extends AuthEvent {}

//
class CreateUserAccountEvent extends AuthEvent {
  final String userId;

  CreateUserAccountEvent(this.userId);
}

// create service provider account event
class CreateServiceProviderAccountEvent extends AuthEvent {
  final String userId;

  CreateServiceProviderAccountEvent(this.userId);
}

// create team account event
class CreateTeamAccountEvent extends AuthEvent {
  final String userId;

  CreateTeamAccountEvent(this.userId);
}
