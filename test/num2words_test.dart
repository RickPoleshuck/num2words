import 'dart:math';

import 'package:num2words/num2words.dart';
import 'package:test/test.dart';

void main() {
  group('Tests', ()
  {
    var num2words = Num2Words.create(language: 'en_US');
    test('whole numbers', () {
      for (int i = 0; i < 10000; ++i) {
        print(num2words.formatWhole(i));
      }
      // expect(num2words.format(123), 'value');
    });


    test('Mexican money', () {
      num2words = Num2Words.create(language: 'es_MX');
      for (double i = 0; i < 10000; ++i) {
        final dec = Random().nextDouble();
        final value = double.parse((i + dec).toStringAsFixed(2));
        print('${value.toStringAsFixed(2)}: ${num2words.formatMoney(value)}');
      }

    });
    test('US money', () {
      num2words = Num2Words.create(language: 'en_US');
      for (double i = 0; i < 10000; ++i) {
        final dec = Random().nextDouble();
        final value = double.parse((i + dec).toStringAsFixed(2));
        print('${value.toStringAsFixed(2)}: ${num2words.formatMoney(value)}');
      }
    });
  });
}
