import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:learning_app/data/core/exceptions.dart';
import 'package:learning_app/data/datasources/dog/dog_data_source.dart';
import 'package:learning_app/domain/core/failures.dart';
import 'package:learning_app/domain/entities/dog.dart';

class DogRepository {
  final DogDataSource dataSource;

  DogRepository({required this.dataSource});

  Future<Either<Failure, Dog>> getRandomDog() async {
    try {
      final result = await dataSource.getRandomDog();

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(NetworkFailure());
    }
  }
}
