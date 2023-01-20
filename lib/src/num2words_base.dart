import 'package:num2words/src/num2words_en.dart';
import 'package:num2words/src/num2words_es.dart';

abstract class Num2Words {
  factory Num2Words.create({language = 'en_US'}) {
    switch (language) {
      case 'en_US':
        return Num2WordsEnUS();
      case 'es_MX':
        return Num2WordsEsMX();
      default:
        throw UnimplementedError('Language $language is not supported');
    }
  }
  String formatMoney(final double value);
  String formatWhole(final int value);
}