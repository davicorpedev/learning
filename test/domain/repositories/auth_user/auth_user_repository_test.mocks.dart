// Mocks generated by Mockito 5.0.0 from annotations
// in learning_app/test/domain/repositories/auth_user/auth_user_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:http/src/client.dart' as _i4;
import 'package:learning_app/data/datasources/auth_user/auth_user_local_data_source.dart'
    as _i5;
import 'package:learning_app/data/datasources/auth_user/auth_user_remote_data_source.dart'
    as _i7;
import 'package:learning_app/data/model/auth_user_model.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i2;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeSharedPreferences extends _i1.Fake implements _i2.SharedPreferences {
}

class _FakeAuthUserModel extends _i1.Fake implements _i3.AuthUserModel {}

class _FakeClient extends _i1.Fake implements _i4.Client {}

/// A class which mocks [AuthUserLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthUserLocalDataSource extends _i1.Mock
    implements _i5.AuthUserLocalDataSource {
  MockAuthUserLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SharedPreferences get sharedPreferences =>
      (super.noSuchMethod(Invocation.getter(#sharedPreferences),
          returnValue: _FakeSharedPreferences()) as _i2.SharedPreferences);
  @override
  _i6.Future<_i3.AuthUserModel> get() =>
      (super.noSuchMethod(Invocation.method(#get, []),
              returnValue: Future.value(_FakeAuthUserModel()))
          as _i6.Future<_i3.AuthUserModel>);
  @override
  _i6.Future<bool> remove() =>
      (super.noSuchMethod(Invocation.method(#remove, []),
          returnValue: Future.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<bool> cache(_i3.AuthUserModel? authUser) =>
      (super.noSuchMethod(Invocation.method(#cache, [authUser]),
          returnValue: Future.value(false)) as _i6.Future<bool>);
}

/// A class which mocks [AuthUserRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthUserRemoteDataSource extends _i1.Mock
    implements _i7.AuthUserRemoteDataSource {
  MockAuthUserRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Client get client => (super.noSuchMethod(Invocation.getter(#client),
      returnValue: _FakeClient()) as _i4.Client);
  @override
  _i6.Future<_i3.AuthUserModel> authenticate(String? email, String? password) =>
      (super.noSuchMethod(Invocation.method(#authenticate, [email, password]),
              returnValue: Future.value(_FakeAuthUserModel()))
          as _i6.Future<_i3.AuthUserModel>);
}
