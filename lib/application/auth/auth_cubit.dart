import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/entities/auth_user.dart';
import 'package:learning_app/domain/repositories/auth_user/auth_user_repository.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUserRepository authUserRepository;

  AuthCubit({required this.authUserRepository}) : super(AppStarted());

  Future<void> saveUser(AuthUser authUser) async {
    emit(UserLoggedIn(authUser: authUser));
  }

  Future<void> removeUser() async {
    await authUserRepository.removeCache();

    emit(UserLoggedOut());
  }

  Future<void> getUser() async {
    final authUser = await authUserRepository.getCache();

    authUser.fold(
      (error) {},
      (authUser) {
        emit(UserLoggedIn(authUser: authUser));
      },
    );
  }
}
