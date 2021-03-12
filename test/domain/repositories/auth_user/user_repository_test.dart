import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_app/data/core/error/exceptions.dart';
import 'package:learning_app/data/datasources/auth_user/auth_user_local_data_source.dart';
import 'package:learning_app/data/datasources/auth_user/auth_user_remote_data_source.dart';
import 'package:learning_app/data/model/auth_user_model.dart';
import 'package:learning_app/domain/core/error/failures.dart';
import 'package:learning_app/domain/repositories/auth_user/auth_user_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_repository_test.mocks.dart';

@GenerateMocks([AuthUserLocalDataSource, AuthUserRemoteDataSource])
void main() {
  late AuthUserRepository repository;
  late MockAuthUserLocalDataSource mockAuthUserLocalDataSource;
  late MockAuthUserRemoteDataSource mockAuthUserRemoteDataSource;

  setUp(() {
    mockAuthUserLocalDataSource = MockAuthUserLocalDataSource();
    mockAuthUserRemoteDataSource = MockAuthUserRemoteDataSource();

    repository = AuthUserRepository(
      localDataSource: mockAuthUserLocalDataSource,
      remoteDataSource: mockAuthUserRemoteDataSource,
    );
  });

  group("authenticate", () {
    final tAuthUserModel = AuthUserModel(token: "token");
    final tAuthUser = tAuthUserModel;

    String email = "email";
    String password = "password";

    test("should return an AuthUser if the request is successful", () async {
      when(mockAuthUserRemoteDataSource.authenticate(any, any))
          .thenAnswer((realInvocation) async => tAuthUserModel);

      final result = await repository.authenticate(email, password);

      verify(mockAuthUserRemoteDataSource.authenticate(email, password));
      expect(result, Right(tAuthUser));
    });

    test("should return a ServerFailure when the request fails", () async {
      when(mockAuthUserRemoteDataSource.authenticate(any, any))
          .thenThrow(ServerException());

      final result = await repository.authenticate(email, password);

      expect(result, Left(ServerFailure()));
    });

    test("should return a NetworkFailure when the user has no internet",
        () async {
      when(mockAuthUserRemoteDataSource.authenticate(any, any))
          .thenThrow(SocketException(""));

      final result = await repository.authenticate(email, password);

      expect(result, Left(NetworkFailure()));
    });
  });
}
