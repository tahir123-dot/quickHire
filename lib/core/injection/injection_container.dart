import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/core/network/network.dart';
import 'package:mobile/shared/bloc/blocimpl/authbloc.dart';
import 'package:mobile/shared/data/datasources/auth_data_sources.dart';
import 'package:mobile/shared/data/repositories/auth_repository.dart';
import 'package:mobile/shared/data/repositories/auth_repository_impl.dart';
import 'package:mobile/utils/storage.dart';

final getIt = GetIt.instance;

void setup() {
  // =========================
  // 1. EXTERNAL (3rd party libs)
  // =========================
  getIt.registerLazySingleton<Dio>(() => DioClient.getDio());

  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => FlutterSecureStorage(),
  );

  // =========================
  // 2. CORE SERVICES
  // =========================
  getIt.registerLazySingleton<IStorageService>(() => StorageService(getIt()));

  // =========================
  // 3. DATA SOURCES
  // =========================
  getIt.registerLazySingleton<AuthDataSources>(
    () => AuthDataSources(getIt<Dio>()),
  );

  // =========================
  // 4. REPOSITORIES
  // =========================
  getIt.registerLazySingleton<AuthRepository>(
    () =>
        AuthRepositoryImpl(getIt<AuthDataSources>(), getIt<IStorageService>()),
  );

  // =========================
  // 5. BLOCS
  // =========================
  getIt.registerFactory<AuthBloc>(() => AuthBloc(getIt<AuthRepository>()));
}
