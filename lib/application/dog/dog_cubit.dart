import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/core/error/failures.dart';
import 'package:learning_app/domain/core/extension_checker.dart';
import 'package:learning_app/domain/entities/dog.dart';
import 'package:learning_app/domain/repositories/dog/dog_repository.dart';

part 'dog_state.dart';

class DogCubit extends Cubit<DogState> {
  final DogRepository repository;
  final ExtensionChecker extensionChecker;

  DogCubit({required this.repository, required this.extensionChecker})
      : super(DogEmpty());

  Future<void> getRandomDog() async {
    emit(DogLoading());

    final result = await repository.getRandomDog();

    result.fold(
      (failure) {
        emit(DogError(message: mapFailureToMessage(failure)));
      },
      (dog) async {
        final type = await extensionChecker.check(dog.url);

        print(type);

        if (type == Type.image) {
          emit(DogImageLoaded(dog: dog));
        } else if (type == Type.video) {
          emit(DogVideoLoaded(dog: dog));
        } else {
          emit(DogError(message: "Unknown media format"));
        }
      },
    );
  }
}
