import 'package:flutter_test/flutter_test.dart';

import 'package:pagarme_flutter_card_hash/pagarme_flutter_card_hash.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
    expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
