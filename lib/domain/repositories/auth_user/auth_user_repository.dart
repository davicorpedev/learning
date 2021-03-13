import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:learning_app/data/core/error/exceptions.dart';
import 'package:learning_app/data/datasources/auth_user/auth_user_local_data_source.dart';
import 'package:learning_app/data/datasources/auth_user/auth_user_remote_data_source.dart';
import 'package:learning_app/data/model/auth_user_model.dart';
import 'package:learning_app/domain/core/error/failures.dart';
import 'package:learning_app/domain/entities/auth_user.dart';

class AuthUserRepository {
  late final AuthUserLocalDataSource localDataSource;
  late final AuthUserRemoteDataSource remoteDataSource;

  AuthUserRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  Future<Either<Failure, AuthUser>> authenticate(
    String email,
    String password,
  ) async {
    try {
      final result = await remoteDataSource.authenticate(email, password);

      this.saveCache(result);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, AuthUser>> getCache() async {
    try {
      final result = await localDataSource.get();

      return Right(result);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  Future<bool> removeCache() async {
    return await localDataSource.remove();
  }

  Future<bool> saveCache(AuthUserModel authUser) async {
    return await localDataSource.cache(authUser);
  }
}
