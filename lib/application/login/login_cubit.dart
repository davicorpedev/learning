import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/core/error/failures.dart';
import 'package:learning_app/domain/entities/auth_user.dart';
import 'package:learning_app/domain/repositories/auth_user/auth_user_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthUserRepository authUserRepository;

  LoginCubit({required this.authUserRepository}) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    final result = await authUserRepository.authenticate(email, password);

    result.fold(
      (failure) {
        emit(LoginError(message: mapFailureToMessage(failure)));
      },
      (authUser) {
        emit(LoginCorrect(authUser: authUser));
      },
    );
  }
}
