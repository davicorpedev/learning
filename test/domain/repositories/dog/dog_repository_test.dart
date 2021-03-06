import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_app/data/core/exceptions.dart';
import 'package:learning_app/data/datasources/dog/dog_data_source.dart';
import 'package:learning_app/data/model/dog_model.dart';
import 'package:learning_app/domain/core/failures.dart';
import 'package:learning_app/domain/repositories/dog/dog_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dog_repository_test.mocks.dart';

@GenerateMocks([DogDataSource])
void main() {
  late DogRepository repository;
  late MockDogDataSource dataSource;

  setUp(() {
    dataSource = MockDogDataSource();
    repository = DogRepository(dataSource: dataSource);
  });

  group("getRandomDog", () {
    final tDogModel = DogModel(url: "test");
    final tDog = tDogModel;

    test("should return a Dog", () async {
      when(dataSource.getRandomDog()).thenAnswer((_) async => tDogModel);

      final result = await repository.getRandomDog();

      verify(dataSource.getRandomDog());
      expect(result, Right(tDog));
    });

    test("should return a ServerFailure when the request fails", () async {
      when(dataSource.getRandomDog()).thenThrow(ServerException());

      final result = await repository.getRandomDog();

      expect(result, Left(ServerFailure()));
    });

    test("should return a NetworkFailure when the user has no internet",
        () async {
      when(dataSource.getRandomDog()).thenThrow(SocketException("test"));

      final result = await repository.getRandomDog();

      expect(result, Left(NetworkFailure()));
    });
  });
}
