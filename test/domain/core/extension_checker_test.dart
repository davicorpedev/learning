import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_app/domain/core/error/failures.dart';
import 'package:learning_app/domain/core/utils/extension_checker.dart';

void main() {
  late ExtensionChecker extensionChecker;

  setUp(() {
    extensionChecker = ExtensionChecker();
  });

  group("check", () {
    test("should return Type.image when the extension is from an image",
        () async {
      final url = "test.png";

      final result = await extensionChecker.check(url);

      expect(result, Right(ExtensionType.image));
    });

    test("should return Type.video when the extension is from a video",
        () async {
      final url = "test.mp4";

      final result = await extensionChecker.check(url);

      expect(result, Right(ExtensionType.video));
    });

    test(
        "should return Type.unknown when the extension is NOT"
        "from a video or image", () async {
      final url = "test.test";

      final result = await extensionChecker.check(url);

      expect(result, Left(UnknownExtensionFailure()));
    });
  });
}
