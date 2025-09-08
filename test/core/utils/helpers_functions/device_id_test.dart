import 'package:bhf_player/core/utils/helpers_functions/helpers_exports.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test device id formated as XXXX-XXXX-XXXX-XXXX ...', () {
    const hash = "abcd1234abcd1234abcd1234";


    const expectedResult = "ABCD-1234-ABCD-1234";
    final result = formatId(hash);

    expect(result, expectedResult);
  });
}
