import 'package:num2words/num2words.dart';

void main() {
  final num2wordsEng = Num2Words(language: 'en_US');
  print('Language: ${num2wordsEng.language}');
  print('123: ${num2wordsEng.formatWhole(123)}');
  print('123.45: ${num2wordsEng.formatMoney(123.45)}');

  final num2wordsMex = Num2Words(language: 'es_MX');
  print('Language: ${num2wordsMex.language}');
  print('123: ${num2wordsMex.formatWhole(123)}');
  print('123.45: ${num2wordsMex.formatMoney(123.45)}');
}
