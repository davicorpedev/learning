import 'dart:convert';

import 'package:learning_app/data/core/error/exceptions.dart';
import 'package:learning_app/data/model/auth_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_USER = 'CACHED_USER';

class AuthUserLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthUserLocalDataSource({required this.sharedPreferences});

  Future<AuthUserModel> getUser() {
    final jsonString = sharedPreferences.getString(CACHED_USER);
    if (jsonString != null) {
      return Future.value(AuthUserModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  Future<bool> removeUser() async {
    return sharedPreferences.remove(CACHED_USER);
  }

  Future<bool> cacheUser(AuthUserModel authUser) async {
    return sharedPreferences.setString(
      CACHED_USER,
      json.encode(authUser.toJson()),
    );
  }
}
