import 'package:learning_app/domain/entities/auth_user.dart';

class AuthUserModel extends AuthUser {
  AuthUserModel({required String token}) : super(token: token);

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(token: json["token"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
