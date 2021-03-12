// Mocks generated by Mockito 5.0.0 from annotations
// in learning_app/test/application/login/login_cubit_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i4;
import 'package:learning_app/data/datasources/auth_user/auth_user_local_data_source.dart'
    as _i2;
import 'package:learning_app/data/datasources/auth_user/auth_user_remote_data_source.dart'
    as _i3;
import 'package:learning_app/domain/core/error/failures.dart' as _i7;
import 'package:learning_app/domain/entities/auth_user.dart' as _i8;
import 'package:learning_app/domain/repositories/auth_user/auth_user_repository.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeAuthUserLocalDataSource extends _i1.Fake
    implements _i2.AuthUserLocalDataSource {}

class _FakeAuthUserRemoteDataSource extends _i1.Fake
    implements _i3.AuthUserRemoteDataSource {}

class _FakeEither<L, R> extends _i1.Fake implements _i4.Either<L, R> {}

/// A class which mocks [AuthUserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthUserRepository extends _i1.Mock
    implements _i5.AuthUserRepository {
  MockAuthUserRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AuthUserLocalDataSource get localDataSource =>
      (super.noSuchMethod(Invocation.getter(#localDataSource),
              returnValue: _FakeAuthUserLocalDataSource())
          as _i2.AuthUserLocalDataSource);
  @override
  set localDataSource(_i2.AuthUserLocalDataSource? _localDataSource) =>
      super.noSuchMethod(Invocation.setter(#localDataSource, _localDataSource),
          returnValueForMissingStub: null);
  @override
  _i3.AuthUserRemoteDataSource get remoteDataSource =>
      (super.noSuchMethod(Invocation.getter(#remoteDataSource),
              returnValue: _FakeAuthUserRemoteDataSource())
          as _i3.AuthUserRemoteDataSource);
  @override
  set remoteDataSource(_i3.AuthUserRemoteDataSource? _remoteDataSource) => super
      .noSuchMethod(Invocation.setter(#remoteDataSource, _remoteDataSource),
          returnValueForMissingStub: null);
  @override
  _i6.Future<_i4.Either<_i7.Failure, _i8.AuthUser>> authenticate(
          String? email, String? password) =>
      (super.noSuchMethod(Invocation.method(#authenticate, [email, password]),
              returnValue:
                  Future.value(_FakeEither<_i7.Failure, _i8.AuthUser>()))
          as _i6.Future<_i4.Either<_i7.Failure, _i8.AuthUser>>);
}
