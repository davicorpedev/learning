import 'package:learning_app/data/model/auth_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_USER = 'CACHED_USER';

class AuthUserLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthUserLocalDataSource({required this.sharedPreferences});

  /*Future<NumberTriviaModel> getUser() {
    final jsonString = sharedPreferences.getString(CACHED_NUMBER_TRIVIA);
    if (jsonString != null) {
      return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }*/

  /*Future<void> cacheUser(AuthUserModel authUser) async {
    return sharedPreferences.setString(
      CACHED_USER,
      json.encode(triviaToCache.toJson()),
    );
  }*/
}
