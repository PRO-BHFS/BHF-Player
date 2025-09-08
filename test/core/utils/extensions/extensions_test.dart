import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('extensions ...', () {
    const value = 0.0;

    final result = value.range(0, 15);

    const excepedValue = "0";

    expect(result, excepedValue);
  });
}
