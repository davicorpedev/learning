import 'package:equatable/equatable.dart';

class Dog extends Equatable {
  late final String url;

  Dog({required this.url});

  @override
  List<Object?> get props => [url];
}
