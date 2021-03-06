import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:learning_app/application/dog/dog_cubit.dart';
import 'package:learning_app/data/datasources/dog/dog_data_source.dart';
import 'package:learning_app/domain/core/extension_checker.dart';

import 'domain/repositories/dog/dog_repository.dart';

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

  ///Extension checker
  sl.registerLazySingleton<ExtensionChecker>(() => ExtensionChecker());

  ///External
  sl.registerLazySingleton(() => http.Client());
}
