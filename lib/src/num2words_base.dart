import 'dart:math';

class Num2Words {
  final String language;
  late Map _langWordMap;
  late int _maxTeen;

  Num2Words({this.language = 'en_US'}) {
    if (!wordMap.keys.contains(language)) {
      throw UnimplementedError('Language is not implemented');
    }
    _langWordMap = wordMap[language]!;
    _maxTeen = _langWordMap['maxTeen']!;
  }

  String formatMoney(double value) {
    final whole = formatWhole(value.toInt());
    final cashWhole = _langWordMap['cashWhole'];
    final fractionCount = _langWordMap['cashDecCount'];
    final fraction = formatWhole(((value - value.toInt()) * pow(10, fractionCount)).round());
    final and = _langWordMap['and'];
    final cashFraction = _langWordMap['cashFraction'];
    return '$whole $cashWhole $and $fraction $cashFraction';
  }

  String formatWhole(int value) {
    if (value >= 100000) {
      throw UnimplementedError('Values above 100,000 are not supported.');
    }
    if (value < 0) {
      throw UnimplementedError('Values below 0 are not supported');
    }
    List<String> result = [];
    final teens = value % 100;
    if (teens <= _maxTeen) {
      if (value <= _maxTeen || teens != 0) {
        result.add(_langWordMap[teens]);
      }
    } else {
      final ones = value % 10;
      if (ones > 0) {
        result.add(_langWordMap[ones]);
      }
      final tens = (teens ~/ 10) * 10;
      result.add(_langWordMap[tens]);
    }
    final hundreds = value ~/ 100 % 10;
    if (hundreds > 0) {
      result.add(_langWordMap[100]);
      result.add(_langWordMap[hundreds]);
    }
    final thousands = value ~/ 1000 % 10;
    if (thousands > 0) {
      result.add(_langWordMap[1000]);
      result.add(_langWordMap[thousands]);
    }
    return result.reversed.join(' ');
  }

  static final wordMap = {
    'en_US': {
      'maxTeen': 19,
      'and': 'and',
      'point': 'point',
      'cashWhole': 'dollars',
      'cashFraction': 'cents',
      'cashDecCount': 2,
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
      100: 'hundred',
      1000: 'thousand',
    }
  };
}
