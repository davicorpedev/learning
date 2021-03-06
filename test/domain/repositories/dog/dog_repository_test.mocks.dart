// Mocks generated by Mockito 5.0.0 from annotations
// in learning_app/test/domain/repositories/dog/dog_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:http/src/client.dart' as _i2;
import 'package:learning_app/data/datasources/dog/dog_data_source.dart' as _i4;
import 'package:learning_app/data/model/dog_model.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeClient extends _i1.Fake implements _i2.Client {}

class _FakeDogModel extends _i1.Fake implements _i3.DogModel {}

/// A class which mocks [DogDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockDogDataSource extends _i1.Mock implements _i4.DogDataSource {
  MockDogDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get client => (super.noSuchMethod(Invocation.getter(#client),
      returnValue: _FakeClient()) as _i2.Client);
  @override
  _i5.Future<_i3.DogModel> getRandomDog() => (super.noSuchMethod(
      Invocation.method(#getRandomDog, []),
      returnValue: Future.value(_FakeDogModel())) as _i5.Future<_i3.DogModel>);
}
