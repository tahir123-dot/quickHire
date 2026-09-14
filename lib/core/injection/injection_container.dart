import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/core/network/network.dart';
import 'package:mobile/provider/bloc/blocimp/provider_bloc.dart';
import 'package:mobile/provider/bloc/blocimp/provider_booking_bloc.dart';
import 'package:mobile/provider/data/datasources/provider_data_sources.dart';
import 'package:mobile/provider/data/repositories/service_provider_repository.dart';
import 'package:mobile/provider/data/repositories/service_provider_repository_impl.dart';
import 'package:mobile/shared/bloc/blocimpl/authbloc.dart';
import 'package:mobile/shared/data/datasources/auth_data_sources.dart';
import 'package:mobile/shared/data/repositories/auth_repository.dart';
import 'package:mobile/shared/data/repositories/auth_repository_impl.dart';
import 'package:mobile/user/bloc/blocimpl/category_bloc.dart';
import 'package:mobile/user/bloc/blocimpl/customer_booking_bloc.dart';
import 'package:mobile/user/bloc/blocimpl/provider_list_bloc.dart';
import 'package:mobile/user/bloc/blocimpl/provider_profile_bloc.dart';
import 'package:mobile/user/data/datasources/user_data_sources.dart';
import 'package:mobile/user/data/repositories/customer_bookings/customer_booking_repository.dart';
import 'package:mobile/user/data/repositories/customer_bookings/customer_booking_repository_impl.dart';
import 'package:mobile/user/data/repositories/main_categories_repository.dart';
import 'package:mobile/user/data/repositories/main_categories_repository_impl.dart';
import 'package:mobile/user/data/repositories/provider_list/provider_list_repository.dart';
import 'package:mobile/user/data/repositories/provider_list/provider_list_repository_impl.dart';
import 'package:mobile/utils/storage.dart';

final getIt = GetIt.instance;

void setup() {
  // =========================
  // 1. EXTERNAL (3rd party libs)
  // =========================
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => FlutterSecureStorage(),
  );

  // =========================
  // 2. CORE SERVICES
  // (StorageService pehle — kyunke Dio ko iski zaroorat hai token ke liye)
  // =========================
  getIt.registerLazySingleton<IStorageService>(() => StorageService(getIt()));

  // Ab Dio ko yahan register karo — IStorageService already ban chuka hai
  getIt.registerLazySingleton<Dio>(
    () => DioClient.getDio(getIt<IStorageService>()),
  );

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
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(getIt<AuthRepository>(), getIt<IStorageService>()),
  );

  // user side registery

  // Datasource
  getIt.registerLazySingleton<UserDataSources>(
    () => UserDataSources(getIt<Dio>()),
  );

  //  Repository
  getIt.registerLazySingleton<MainCategoriesRepository>(
    //  interface
    () => MainCategoriesRepositoryImpl(getIt<UserDataSources>()),
  );

  // repository for provider list
  getIt.registerLazySingleton<ProviderListRepository>(
    () => ProviderListRepositoryImpl(getIt<UserDataSources>()),
  );

  // bloc
  getIt.registerFactory<CategoryBloc>(
    () => CategoryBloc(getIt<MainCategoriesRepository>()),
  );

  // bloc for provider list
  getIt.registerFactory<ProviderListBloc>(
    () => ProviderListBloc(getIt<ProviderListRepository>()),
  );

  // bloc for provider profile
  getIt.registerFactory<ProviderProfileViewBloc>(
    () => ProviderProfileViewBloc(getIt<ProviderListRepository>()),
  );
  // provider side registery

  // ProviderDataSources
  getIt.registerLazySingleton<ProviderDataSources>(
    () => ProviderDataSources(getIt<Dio>()),
  );

  // Repository
  getIt.registerLazySingleton<ServiceProviderRepository>(
    () => ServiceProviderRepositoryImpl(getIt<ProviderDataSources>()),
  );

  // Bloc
  getIt.registerFactory<ProviderBloc>(
    () => ProviderBloc(getIt<ServiceProviderRepository>()),
  );

  getIt.registerFactory<ProviderBookingBloc>(
    () => ProviderBookingBloc(getIt<ServiceProviderRepository>()),
  );

  // custoemr booking injection
  getIt.registerLazySingleton<CustomerBookingRepository>(
    () => CustomerBookingRepositoryImpl(getIt<UserDataSources>()),
  );

  getIt.registerFactory<CustomerBookingBloc>(
    () => CustomerBookingBloc(getIt<CustomerBookingRepository>()),
  );
}
