import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_app/application/login/login_cubit.dart';
import 'package:learning_app/domain/core/error/failures.dart';
import 'package:learning_app/domain/entities/auth_user.dart';
import 'package:learning_app/domain/repositories/auth_user/auth_user_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_cubit_test.mocks.dart';

@GenerateMocks([AuthUserRepository])
void main() {
  late LoginCubit cubit;
  late MockAuthUserRepository mockAuthUserRepository;

  setUp(() {
    mockAuthUserRepository = MockAuthUserRepository();
    cubit = LoginCubit(authUserRepository: mockAuthUserRepository);
  });

  group("login", () {
    AuthUser authUser = AuthUser(token: "token");

    test(
      "should emit [LoginLoading, LoginCorrect] when the "
      "email and password are valid",
      () {
        when(mockAuthUserRepository.authenticate(any, any))
            .thenAnswer((realInvocation) async => Right(authUser));

        final expected = [
          LoginLoading(),
          LoginCorrect(authUser: authUser),
        ];

        expectLater(cubit, emitsInOrder(expected));

        cubit.login("email", "password");
      },
    );

    test(
      "should emit [LoginLoading, LoginFailure] when "
      "email and/or password are NOT valid",
      () {
        when(mockAuthUserRepository.authenticate(any, any))
            .thenAnswer((realInvocation) async => Left(LoginFailure()));

        final expected = [
          LoginLoading(),
          LoginError(message: LOGIN_FAILURE_MESSAGE),
        ];

        expectLater(cubit, emitsInOrder(expected));

        cubit.login("", "");
      },
    );
  });
}