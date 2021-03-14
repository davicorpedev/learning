import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:learning_app/data/core/error/exceptions.dart';
import 'package:learning_app/data/datasources/auth_user/auth_user_local_data_source.dart';
import 'package:learning_app/data/model/auth_user_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/fixture_reader.dart';
import 'auth_user_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late AuthUserLocalDataSource dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource =
        AuthUserLocalDataSource(sharedPreferences: mockSharedPreferences);
  });

  group("get", () {
    final tAuthUserModel =
        AuthUserModel.fromJson(json.decode(fixture('auth_user.json')));

    test(
      'should return an AuthUserModel data when the cached data is present',
      () async {
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixture("auth_user.json"));

        final result = await dataSource.get();

        expect(result, tAuthUserModel);
      },
    );

    test(
      'should return a CacheException when the cached data is NOT present',
      () async {
        when(mockSharedPreferences.getString(any)).thenReturn(null);

        final call = dataSource.get;

        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );
  });
}
