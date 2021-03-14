import 'package:dartz/dartz.dart';
import 'package:learning_app/domain/core/error/failures.dart';
import 'package:mime/mime.dart';

enum ExtensionType { image, video }

class ExtensionChecker {
  String? getType(String source) {
    return lookupMimeType(source);
  }

  Future<Either<Failure, ExtensionType>> check(String source) async {
    final String? type = getType(source);

    if (type == null) {
      return Left(UnknownExtensionFailure());
    } else {
      if (type.contains("image")) {
        return Right(ExtensionType.image);
      } else if (type.contains("video")) {
        return Right(ExtensionType.video);
      } else {
        return Left(UnknownExtensionFailure());
      }
    }
  }
}
