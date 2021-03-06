import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:learning_app/data/core/exceptions.dart';
import 'package:learning_app/data/datasources/dog/dog_data_source.dart';
import 'package:learning_app/data/model/dog_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'dog_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late DogDataSource dataSource;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    dataSource = DogDataSource(client: mockClient);
  });

  group("getRandomDog", () {
    final tDogModel = DogModel(url: "test");

    test("should return a Dog if the request is successful", () async {
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response(fixture("dog.json"), 200));

      final result = await dataSource.getRandomDog();

      verify(mockClient.get(any));
      expect(result, tDogModel);
    });

    test("should return a ServerException if the request fails", () async {
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response("Error", 404));

      final call = dataSource.getRandomDog;

      expect(() => call(), throwsA(isA<ServerException>()));
    });
  });
}
