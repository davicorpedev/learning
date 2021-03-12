import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:learning_app/data/model/auth_user_model.dart';
import 'package:learning_app/domain/entities/auth_user.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tAuthUserModel = AuthUserModel(token: "token");

  test("should be a subclass of AuthUser entity", () async {
    expect(tAuthUserModel, isA<AuthUser>());
  });

  group("fromJson", () {
    test("should return a valid object", () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture("auth_user.json"));

      final result = AuthUserModel.fromJson(jsonMap);

      expect(result, tAuthUserModel);
    });
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        final result = tAuthUserModel.toJson();

        final expectedMap = {
          "token": "token",
        };

        expect(result, expectedMap);
      },
    );
  });
}
