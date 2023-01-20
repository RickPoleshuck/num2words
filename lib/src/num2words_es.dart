import 'package:num2words/num2words.dart';

class Num2WordsEsMX implements Num2Words {
  @override
  String formatMoney(final double value) {
    final dollars = value.toInt();
    final whole = value >= 1.0 ? formatWhole(dollars) : '';
    final cents = ((value - dollars) * 100).round();
    final fraction = formatWhole(cents);
    final dollarName = dollars == 1 ? 'peso' : 'pesos';
    final centName = cents == 1 ? 'centavo' : 'centavos';
    return '${value >= 1.0 ? '$whole $dollarName y ' : ''}$fraction $centName';
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
    if (teens <= 15) {
      if (value == 1) {
        result.add('un');
      } else if (value <= 15 || teens != 0) {
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
    0: 'cero',
    1: 'uno',
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
  };
}
