import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String token;

  AuthUser({required this.token});

  @override
  List<Object?> get props => [token];
}
