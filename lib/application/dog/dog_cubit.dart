import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_app/domain/core/failures.dart';
import 'package:learning_app/domain/entities/dog.dart';
import 'package:learning_app/domain/repositories/dog/dog_repository.dart';
import 'package:mime/mime.dart';

part 'dog_state.dart';

class DogCubit extends Cubit<DogState> {
  final DogRepository repository;

  DogCubit({required this.repository}) : super(DogEmpty());

  Future<void> getRandomDog() async {
    emit(DogLoading());
    final result = await repository.getRandomDog();

    result.fold(
      (failure) {
        emit(DogError(message: mapFailureToMessage(failure)));
      },
      (dog) {
        final type = lookupMimeType(dog.url);

        if (type!.contains("image")) {
          emit(DogImageLoaded(dog: dog));
        } else if (type.contains("video")) {
          emit(DogVideoLoaded(dog: dog));
        }
      },
    );
  }
}
