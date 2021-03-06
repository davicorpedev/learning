import 'package:mime/mime.dart';

enum Type { image, video, unknown }

class ExtensionChecker {
  Future<Type> check(String url) async {
    final String? type = lookupMimeType(url);

    if (type == null) {
      return Type.unknown;
    } else {
      if (type.contains("image")) {
        return Type.image;
      } else if (type.contains("video")) {
        return Type.video;
      } else {
        return Type.unknown;
      }
    }
  }
}
