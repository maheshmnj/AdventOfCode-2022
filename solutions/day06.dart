import '../utils/index.dart';

class Day06 extends GenericDay {
  Day06() : super(6);

  @override
  String parseInput() {
    return input.asString;
  }

  @override
  int solvePart1() {
    int messageLength = 4;
    String message = parseInput();
    int index = 0;
    for (int i = 0; i < message.length - messageLength; i++) {
      Map<String, int> freq = {};
      String current = message.substring(i, i + messageLength);
      current.split("").toList().forEach((letter) {
        freq[letter] = (freq[letter] ?? 0) + 1;
      });
      if (freq.length == messageLength) {
        index = i + messageLength;
        print(current);
        break;
      }
    }
    return index;
  }

  @override
  int solvePart2() {
    int messageLength = 14;
    String message = parseInput();
    int index = 0;
    for (int i = 0; i < message.length - messageLength; i++) {
      Map<String, int> freq = {};
      String current = message.substring(i, i + messageLength);
      current.split("").toList().forEach((letter) {
        freq[letter] = (freq[letter] ?? 0) + 1;
      });
      if (freq.length == messageLength) {
        index = i + messageLength;
        print(current);
        break;
      }
    }
    return index;
  }
}
