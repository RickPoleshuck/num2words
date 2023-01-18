import 'package:num2words/num2words.dart';
import 'package:test/test.dart';

void main() {
  group('Tests', ()
  {
    final num2words = Num2Words();

    setUp(() {
      // Additional setup goes here.
    });

    test('whole numbers', () {
      for (int i = 0; i < 10000; ++i) {
        print(num2words.formatWhole(i));
      }
      // expect(num2words.format(123), 'value');
    });
    test('money', () {
      final m = 123.45;
      var money = num2words.formatMoney(m);
      print('$m: $money');
      // expect(num2words.format(123), 'value');
    });
  });
}
