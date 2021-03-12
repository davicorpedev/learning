import 'package:equatable/equatable.dart';

const String SERVER_FAILURE_MESSAGE = "Server Failure";
const String NETWORK_FAILURE_MESSAGE = "Network Failure";
const String LOGIN_FAILURE_MESSAGE = "Network Failure";
const String MEDIA_FAILURE_MESSAGE = "Unknown media format";

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case NetworkFailure:
      return NETWORK_FAILURE_MESSAGE;
    case LoginFailure:
      return LOGIN_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class NetworkFailure extends Failure {}

class LoginFailure extends Failure {}
