import 'package:aims/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:aims/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:aims/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:aims/features/auth/domain/repository/auth_repository.dart';
import 'package:aims/features/auth/domain/usecases/current_user.dart';
import 'package:aims/features/auth/domain/usecases/user_login.dart';
import 'package:aims/features/auth/domain/usecases/user_sign_up.dart';
import 'package:aims/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:aims/core/secrets/app_secrets.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseKey);

  serviceLocator.registerLazySingleton(() => supabase.client);

  // core
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

Future<void> _initAuth() async {
  // Data Source
  serviceLocator
  ..registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImplementation(serviceLocator())
  )
  // Repository
  ..registerFactory<AuthRepository>(
    () => AuthRepositoryImplementation(serviceLocator())
  )
  // Usecases
  ..registerFactory(
    () => UserSignUp(serviceLocator())
  )
  ..registerFactory(
    () => UserLogin(serviceLocator())
  )
  ..registerFactory(
    () => CurrentUser(serviceLocator())
  )
    // Bloc
  ..registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
      userLogin: serviceLocator(),
      currentUser: serviceLocator(),
      appUserCubit: serviceLocator(),
    )
  );
}