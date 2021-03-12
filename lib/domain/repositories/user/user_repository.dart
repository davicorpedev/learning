import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/core/error/failures.dart';
import 'package:learning_app/domain/entities/auth_user.dart';

class UserRepository {
  //final LocalDataSource localDataSource;
  //final RemoteDataSource remoteDataSource;

  Future<Either<Failure, AuthUser>> authenticate(
    String email,
    String password,
  ) async {
    //return Left(LoginFailure());
    return Right(AuthUser(token: "token"));
  }
}
