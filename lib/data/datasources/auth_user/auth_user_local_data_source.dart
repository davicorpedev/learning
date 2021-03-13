import 'dart:convert';

import 'package:learning_app/data/core/error/exceptions.dart';
import 'package:learning_app/data/model/auth_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_USER = 'CACHED_USER';

class AuthUserLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthUserLocalDataSource({required this.sharedPreferences});

  Future<AuthUserModel> get() async{
    final jsonString = sharedPreferences.getString(CACHED_USER);
    if (jsonString != null) {
      return AuthUserModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }

  Future<bool> remove() async {
    return sharedPreferences.remove(CACHED_USER);
  }

  Future<bool> cache(AuthUserModel authUser) async {
    return sharedPreferences.setString(
      CACHED_USER,
      json.encode(authUser.toJson()),
    );
  }
}
