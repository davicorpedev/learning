import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_app/application/dog/dog_cubit.dart';
import 'package:learning_app/domain/core/error/failures.dart';
import 'package:learning_app/domain/core/extension_checker.dart';
import 'package:learning_app/domain/entities/dog.dart';
import 'package:learning_app/domain/repositories/dog/dog_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dog_cubit_test.mocks.dart';

@GenerateMocks([DogRepository, ExtensionChecker])
void main() {
  late MockDogRepository mockDogRepository;
  late MockExtensionChecker mockExtensionChecker;
  late DogCubit cubit;

  setUp(() {
    mockDogRepository = MockDogRepository();
    mockExtensionChecker = MockExtensionChecker();

    cubit = DogCubit(
      repository: mockDogRepository,
      extensionChecker: mockExtensionChecker,
    );
  });

  group("getRandomDog", () {
    final tDog = Dog(url: "test.png");

    test(
        "should emit [DogLoading, DogImageLoaded] when the Dog is gotten successfully and "
        "his url is an image", () {
      when(mockDogRepository.getRandomDog())
          .thenAnswer((realInvocation) async => Right(tDog));

      when(mockExtensionChecker.check(any))
          .thenAnswer((realInvocation) async => Type.image);

      final expected = [
        DogLoading(),
        DogImageLoaded(dog: tDog),
      ];

      expectLater(cubit, emitsInOrder(expected));

      cubit.getRandomDog();
    });

    test(
        "should emit [DogLoading, DogVideoLoaded] when the Dog is gotten successfully and "
        "his url is a video", () {
      when(mockDogRepository.getRandomDog())
          .thenAnswer((realInvocation) async => Right(tDog));

      when(mockExtensionChecker.check(any))
          .thenAnswer((realInvocation) async => Type.video);

      final expected = [
        DogLoading(),
        DogVideoLoaded(dog: tDog),
      ];

      expectLater(cubit, emitsInOrder(expected));

      cubit.getRandomDog();
    });

    test(
        "should emit [DogLoading, DogError] when the Dog is gotten successfully and "
        "his url is unknown", () {
      when(mockDogRepository.getRandomDog())
          .thenAnswer((realInvocation) async => Right(tDog));

      when(mockExtensionChecker.check(any))
          .thenAnswer((realInvocation) async => Type.unknown);

      final expected = [
        DogLoading(),
        DogError(message: MEDIA_FAILURE_MESSAGE),
      ];

      expectLater(cubit, emitsInOrder(expected));

      cubit.getRandomDog();
    });

    test("should emit [DogLoading, DogError] when the request fails", () {
      when(mockDogRepository.getRandomDog())
          .thenAnswer((realInvocation) async => Left(NetworkFailure()));

      final expected = [
        DogLoading(),
        DogError(message: NETWORK_FAILURE_MESSAGE),
      ];

      expectLater(cubit, emitsInOrder(expected));

      cubit.getRandomDog();
    });
  });
}
