import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:learning_app/data/model/dog_model.dart';
import 'package:learning_app/domain/entities/dog.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tDogModel = DogModel(url: "test");

  test("should be a subclass of Dog entity", () async {
    expect(tDogModel, isA<Dog>());
  });

  group("fromJson", () {
    test("should return a valid object", () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture("dog.json"));

      final result = DogModel.fromJson(jsonMap);

      expect(result, tDogModel);
    });
  });
}
