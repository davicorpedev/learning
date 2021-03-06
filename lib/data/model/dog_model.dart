import 'package:learning_app/domain/entities/dog.dart';

class DogModel extends Dog {
  DogModel({
    required String url,
  }) : super(url: url);

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      url: json["url"],
    );
  }
}
