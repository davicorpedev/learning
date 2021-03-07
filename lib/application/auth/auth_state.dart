part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthState {}

class UserLoggedIn extends AuthState {
  final AuthUser authUser;

  UserLoggedIn(this.authUser);

  @override
  List<Object> get props => [authUser];
}

class UserLoggedOut extends AuthState {}
