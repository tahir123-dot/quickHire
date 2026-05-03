import 'package:flutter_bloc/flutter_bloc.dart';
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
        ),
      );
      emit(SignupSuccess(message: "Signup successful"));
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
}
