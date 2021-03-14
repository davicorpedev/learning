import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:learning_app/application/auth/auth_cubit.dart';
import 'package:learning_app/application/dog/dog_cubit.dart';
import 'package:learning_app/application/login/form/login_form_cubit.dart';
import 'package:learning_app/application/login/login_cubit.dart';
import 'package:learning_app/application/media/media_cubit.dart';
import 'package:learning_app/data/datasources/auth_user/auth_user_local_data_source.dart';
import 'package:learning_app/data/datasources/auth_user/auth_user_remote_data_source.dart';
import 'package:learning_app/data/datasources/dog/dog_data_source.dart';
import 'package:learning_app/domain/repositories/auth_user/auth_user_repository.dart';
import 'package:learning_app/domain/repositories/dog/dog_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'domain/core/utils/extension_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///Dog
  //Cubit
  sl.registerFactory<DogCubit>(
      () => DogCubit(repository: sl(), extensionChecker: sl()));

  //Repository
  sl.registerLazySingleton<DogRepository>(
      () => DogRepository(dataSource: sl()));

  //DataSource
  sl.registerLazySingleton<DogDataSource>(() => DogDataSource(client: sl()));

  ///Auth
  //Cubit
  sl.registerFactory<AuthCubit>(() => AuthCubit(authUserRepository: sl()));

  //Repository
  sl.registerLazySingleton<AuthUserRepository>(() => AuthUserRepository(
        remoteDataSource: sl(),
        localDataSource: sl(),
      ));

  //DataSource
  sl.registerLazySingleton<AuthUserRemoteDataSource>(
      () => AuthUserRemoteDataSource(
            client: sl(),
          ));

  sl.registerLazySingleton<AuthUserLocalDataSource>(
      () => AuthUserLocalDataSource(
            sharedPreferences: sl(),
          ));

  ///Login
  //Cubit
  sl.registerFactory<LoginCubit>(() => LoginCubit(authUserRepository: sl()));

  ///LoginForm
  //Cubit
  sl.registerFactory<LoginFormCubit>(() => LoginFormCubit());

  ///Media
  //Cubit
  sl.registerFactory<MediaCubit>(() => MediaCubit());

  ///Extension checker
  sl.registerLazySingleton<ExtensionChecker>(() => ExtensionChecker());

  ///External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client());
}
