import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/core/error/failures.dart';
import 'package:learning_app/domain/entities/auth_user.dart';
import 'package:learning_app/domain/repositories/user/user_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserRepository userRepository;

  LoginCubit({required this.userRepository}) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    final result = await userRepository.authenticate(email, password);

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
