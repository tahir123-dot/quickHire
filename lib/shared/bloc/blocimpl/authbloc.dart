import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/routes/auth/auth_service.dart';
import 'package:mobile/shared/bloc/event/auth_event.dart';
import 'package:mobile/shared/bloc/state/auth_state.dart';
import 'package:mobile/shared/data/dto/login.dart';
import 'package:mobile/shared/data/dto/otp.dart';
import 'package:mobile/shared/data/dto/signup.dart';
import 'package:mobile/shared/data/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<SignupEvent>(_signpEvent);
    on<OtpVerificationEvent>(_otpVerificationEvent);
    on<ResendOtpEvent>(_resendOtpEvent);
    on<LoginEvent>(_loginEvent);
    on<LogoutEvent>(_logoutEvent);
    on<CreateUserAccountEvent>(_createUserAccountEvent);
    on<CreateServiceProviderAccountEvent>(_createServiceProviderAccountEvent);
    on<CreateTeamAccountEvent>(_createTeamAccountEvent);
  }

  // Event handler for LoginEvent
  Future<void> _loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final isLoggedIn = await authRepository.login(
        LoginDto(email: event.email, password: event.password),
      );
      if (isLoggedIn) {
        emit(LoginSuccess(message: "Login successful"));
      } else {
        emit(AuthError("Login failed"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Event handler for SignupEvent
  Future<void> _signpEvent(SignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepository.signup(
        SignupDto(
          name: event.name,
          email: event.email,
          password: event.password,
          role: event.role,
        ),
      );
      emit(SignupSuccess(message: "Signup successful"));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Event handler for LogoutEvent
  Future<void> _logoutEvent(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepository.deleteToken();

      // 🔥 IMPORTANT FIX
      AuthService.clear();

      emit(LogoutSuccess(message: "Logout successful"));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Event handler for OtpVerificationEvent
  Future<void> _otpVerificationEvent(
    OtpVerificationEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final isVerified = await authRepository.verifyOtp(
        OtpDto(email: event.email, otp: event.otp),
      );
      if (isVerified) {
        emit(OtpVerifySuccess(message: "OTP verification successful"));
      } else {
        emit(AuthError("OTP verification failed"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Event handler for ResendOtpEvent
  Future<void> _resendOtpEvent(
    ResendOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await authRepository.resendOtp(event.email);
      emit(ResendOtpSuccess(message: "OTP resent successfully"));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Event handler for CreateUserAccountEvent
  Future<void> _createUserAccountEvent(
    CreateUserAccountEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final isCreated = await authRepository.createUserAccount(event.userId);
      if (isCreated) {
        emit(
          UserAccountCreationSuccess(
            message: "User account created successfully",
          ),
        );
      } else {
        emit(AuthError("User account creation failed"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Event handler for CreateServiceProviderAccountEvent
  Future<void> _createServiceProviderAccountEvent(
    CreateServiceProviderAccountEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final isCreated = await authRepository.createServiceProviderAccount(
        event.userId,
      );
      if (isCreated) {
        emit(
          ServiceProviderAccountCreationSuccess(
            message: "Service provider account created successfully",
          ),
        );
      } else {
        emit(AuthError("Service provider account creation failed"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Event handler for CreateTeamAccountEvent
  Future<void> _createTeamAccountEvent(
    CreateTeamAccountEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final isCreated = await authRepository.createTeamAccount(event.userId);
      if (isCreated) {
        emit(
          TeamAccountCreationSuccess(
            message: "Team account created successfully",
          ),
        );
      } else {
        emit(AuthError("Team account creation failed"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
