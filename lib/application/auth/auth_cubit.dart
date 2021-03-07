import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/entities/auth_user.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {


  AuthCubit() : super(AppStarted());

  Future<void> saveUser(AuthUser authUser) async {
    emit(UserLoggedIn(authUser));
  }

  Future<void> removeUser() async {
    emit(UserLoggedOut());
  }
}
