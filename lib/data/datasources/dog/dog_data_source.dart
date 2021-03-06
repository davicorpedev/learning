import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learning_app/data/core/exceptions.dart';
import 'package:learning_app/data/model/dog_model.dart';

class DogDataSource {
  final http.Client client;

  DogDataSource({required this.client});

  Future<DogModel> getRandomDog() async {
    final response = await client.get(Uri.https("random.dog", "/woof.json"));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      return DogModel.fromJson(body);
    } else {
      throw ServerException();
    }
  }
}
