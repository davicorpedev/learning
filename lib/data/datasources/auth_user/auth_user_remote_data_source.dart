import 'package:http/http.dart' as http;
import 'package:learning_app/data/model/auth_user_model.dart';

class AuthUserRemoteDataSource {
  final http.Client client;

  AuthUserRemoteDataSource({required this.client});

  Future<AuthUserModel> authenticate(
    String email,
    String password,
  ) async {
    return AuthUserModel(token: "token");
  }
}
