import 'dart:math';

class Num2Words {
  final String language;
  late Map _langWordMap;
  late int _maxTeen;
  late int _fractionCount;
  late String _cashWhole;
  late String _cashFraction;
  late String _cashWholeOne;
  late String _cashFractionOne;
  late String _and;

  Num2Words({this.language = 'en_US'}) {
    if (!wordMap.keys.contains(language)) {
      throw UnimplementedError('Language is not implemented');
    }
    _langWordMap = wordMap[language]!;
    _maxTeen = _langWordMap['maxTeen']!;
    _fractionCount = _langWordMap['cashDecCount'];
    _cashWhole = _langWordMap['cashWhole'];
    _cashFraction = _langWordMap['cashFraction'];
    _cashWholeOne = _langWordMap['cashWholeOne'];
    _cashFractionOne = _langWordMap['cashFractionOne'];
    _and = _langWordMap['and'];
  }

  String formatMoney(double value) {
    final dollars = value.toInt();
    final whole = value >= 1.0 ? formatWhole(dollars) : '';
    final cents = ((value - dollars) * pow(10, _fractionCount)).round();
    final fraction =
        formatWhole(cents);
    final cashWhole = dollars == 1 ? _cashWholeOne : _cashWhole;
    final cashFraction = cents == 1 ? _cashFractionOne : _cashFraction;
    return '${value >= 1.0 ? '$whole $cashWhole $_and ' : ''}$fraction $cashFraction';
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
      'cashWholeOne': 'dollar',
      'cashFraction': 'cents',
      'cashFractionOne': 'cent',
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
    },
    'es_MX': {
      'maxTeen': 15,
      'and': 'y',
      'point': 'punto',
      'cashWhole': 'pesos',
      'cashWholeOne': 'peso',
      'cashFraction': 'centavos',
      'cashFractionOne': 'centavo',
      'cashDecCount': 2,
      0: 'cero',
      1: 'un',
      2: 'dos',
      3: 'tres',
      4: 'cuatro',
      5: 'cinco',
      6: 'seis',
      7: 'siete',
      8: 'ocho',
      9: 'nueve',
      10: 'diez',
      11: 'once',
      12: 'doce',
      13: 'trece',
      14: 'catorce',
      15: 'quince',
      20: 'veinte',
      30: 'treinta',
      40: 'cuarenta',
      50: 'cincuenta',
      60: 'sesenta',
      70: 'setenta',
      80: 'ochenta',
      90: 'noventa',
      100: 'ciento',
      1000: 'mil',
    }
  };
}
