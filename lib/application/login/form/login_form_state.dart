part of 'login_form_cubit.dart';

@immutable
abstract class LoginFormState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginFormInitial extends LoginFormState {}

class LoginFormLoading extends LoginFormState {}

class LoginFormCorrect extends LoginFormState {
  final String email;
  final String password;

  LoginFormCorrect({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LoginFormError extends LoginFormState {
  final String message;

  LoginFormError({required this.message});

  @override
  List<Object?> get props => [message];
}
