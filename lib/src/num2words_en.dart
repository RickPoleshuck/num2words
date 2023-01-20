import 'package:num2words/num2words.dart';

class Num2WordsEnUS implements Num2Words {
  @override
  String formatMoney(final double value) {
    final dollars = value.toInt();
    final whole = value >= 1.0 ? formatWhole(dollars) : '';
    final cents = ((value - dollars) * 100).round();
    final fraction = formatWhole(cents);
    final dollarName = dollars == 1 ? 'dollar' : 'dollars';
    final centName = cents == 1 ? 'cent' : 'cents';
    return '${value >= 1.0 ? '$whole $dollarName and ' : ''}$fraction $centName';
  }

  @override
  String formatWhole(final int value) {
    if (value >= 100000) {
      throw UnimplementedError('Values above 10,000 are not supported.');
    }
    if (value < 0) {
      throw UnimplementedError('Values below 0 are not supported');
    }
    List<String> result = [];
    final teens = value % 100;
    if (teens <= 19) {
      if (value <= 19 || teens != 0) {
        result.add(_wordMap[teens]!);
      }
    } else {
      final ones = value % 10;
      if (ones > 0) {
        result.add(_wordMap[ones]!);
      }
      final tens = (teens ~/ 10) * 10;
      result.add(_wordMap[tens]!);
    }
    final hundreds = value ~/ 100 % 10;
    if (hundreds > 0) {
      result.add('hundred');
      result.add(_wordMap[hundreds]!);
    }
    final thousands = value ~/ 1000 % 10;
    if (thousands > 0) {
      result.add('thousand');
      result.add(_wordMap[thousands]!);
    }
    return result.reversed.join(' ');
  }

  final _wordMap = {
    0: 'zero',
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
    5: 'five',
    6: 'six',
    7: 'seven',
    8: 'eight',
    9: 'nine',
    10: 'ten',
    11: 'eleven',
    12: 'twelve',
    13: 'thirteen',
    14: 'fourteen',
    15: 'fifteen',
    16: 'sixteen',
    17: 'seventeen',
    18: 'eighteen',
    19: 'nineteen',
    20: 'twenty',
    30: 'thirty',
    40: 'forty',
    50: 'fifty',
    60: 'sixty',
    70: 'seventy',
    80: 'eighty',
    90: 'ninety',
  };
}
