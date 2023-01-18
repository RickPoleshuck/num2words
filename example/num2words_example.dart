import 'package:num2words/num2words.dart';

void main() {
  final num2words = Num2Words();
  print('Language: ${num2words.language}');
  print('123: ${num2words.formatWhole(123)}');
}
