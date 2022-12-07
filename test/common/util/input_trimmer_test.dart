import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:starwars_app/common/util/input_trimmer.dart';

void main() {
  late InputTrimmer inputTrimmer;

  setUp(() {
    inputTrimmer = InputTrimmer();
  });

  group("inputTrimmer", () {
    const tString = "Death Star";
    test(
      'should remove any leading or trailing white space from entered strings',
      () async {
        // arrange
        const str = "    Death Star     ";
        // act
        final result = inputTrimmer.trimWhiteSpace(str);
        // assert
        expect(result, const Right(tString));
      },
    );
  });
}
