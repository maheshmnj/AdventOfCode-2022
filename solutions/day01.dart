import '../utils/index.dart';

class Day01 extends GenericDay {
  Day01() : super(1);

  @override
  List<String> parseInput() {
    return input.getPerLine();
  }

  int getNumber(String input) {
    var number = 0;
    const factor = 10;
    for (final char in input.split('')) {
      if (char.codeUnitAt(0) >= 48 && char.codeUnitAt(0) <= 57) {
        number = number * factor + int.parse(char);
      }
    }
    return number;
  }

  int firstDigit(int n) {
    var x = n;
    while (x >= 10) {
      x = x ~/ 10;
    }
    return x;
  }

  @override
  int solvePart1() {
    final inputs = parseInput();
    var sum = 0;
    for (final input in inputs) {
      final out = getNumber(input);
      final first = firstDigit(out);
      final last = out % 10;
      final result = first * 10 + last;
      sum += result;
    }
    return sum;
  }

  @override
  int solvePart2() {
    return 0;
  }
}
