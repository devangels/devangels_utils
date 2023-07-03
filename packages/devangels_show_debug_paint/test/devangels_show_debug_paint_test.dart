import 'package:flutter_test/flutter_test.dart';

import 'package:devangels_show_debug_paint/devangels_show_debug_paint.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });
}
