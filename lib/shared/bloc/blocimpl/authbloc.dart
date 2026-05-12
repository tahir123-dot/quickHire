import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/shared/bloc/event/auth_event.dart';
import 'package:mobile/shared/bloc/state/auth_state.dart';
import 'package:mobile/shared/data/dto/login.dart';
import 'package:mobile/shared/data/dto/otp.dart';
import 'package:mobile/shared/data/dto/signup.dart';
import 'package:mobile/shared/data/repositories/auth_repository.dart';
import 'package:mobile/utils/storage.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final IStorageService storage;

  AuthBloc(this.authRepository, this.storage) : super(AuthInitial()) {
    on<CheckAuthEvent>(_checkAuthEvent);

    on<LoginEvent>(_loginEvent);
    on<SignupEvent>(_signpEvent);

    on<OtpVerificationEvent>(_otpVerificationEvent);
    on<ResendOtpEvent>(_resendOtpEvent);

    on<CreateUserAccountEvent>(_createUserAccountEvent);
    on<CreateServiceProviderAccountEvent>(_createServiceProviderAccountEvent);
    on<CreateTeamAccountEvent>(_createTeamAccountEvent);
  }

  // ================= AUTH CHECK =================
  Future<void> _checkAuthEvent(
    CheckAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    final token = await storage.getToken();
    final role = await storage.getUserRole();

    if (token != null && role != null) {
      emit(Authenticated(token: token, role: role));
    } else {
      emit(Unauthenticated());
    }
  }

  // ================= LOGIN =================
  Future<void> _loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final response = await authRepository.login(
        LoginDto(email: event.email, password: event.password),
      );

      final token = response.response.token;

      await storage.saveToken(token);

      final role = await storage.getUserRole();

      emit(Authenticated(token: token, role: role ?? ""));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // ================= SIGNUP =================
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

  // ================= OTP VERIFY =================
  Future<void> _otpVerificationEvent(
    OtpVerificationEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final response = await authRepository.verifyOtp(
        OtpDto(email: event.email, otp: event.otp),
      );

      final token = response.response.token;

      await storage.saveToken(token);

      final role = await storage.getUserRole();

      emit(Authenticated(token: token, role: role ?? ""));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // ================= RESEND OTP =================
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

  // ================= USER ACCOUNT =================
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

  // ================= SERVICE PROVIDER ACCOUNT =================
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

  // ================= TEAM ACCOUNT =================
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
