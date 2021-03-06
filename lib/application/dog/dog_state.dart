part of 'dog_cubit.dart';

abstract class DogState extends Equatable {
  const DogState();

  @override
  List<Object> get props => [];
}

class DogEmpty extends DogState {}

class DogLoading extends DogState {}

abstract class DogLoaded extends DogState {
  final Dog dog;

  DogLoaded({required this.dog});

  @override
  List<Object> get props => [dog];
}

class DogImageLoaded extends DogLoaded {
  DogImageLoaded({required Dog dog}) : super(dog: dog);
}

class DogVideoLoaded extends DogLoaded {
  DogVideoLoaded({required Dog dog}) : super(dog: dog);
}

class DogError extends DogState {
  final String message;

  DogError({required this.message});

  @override
  List<Object> get props => [message];
}
