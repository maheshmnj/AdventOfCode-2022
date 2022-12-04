import '../utils/extensions.dart';
import '../utils/index.dart';

class Day03 extends GenericDay {
  Day03() : super(3);

  @override
  List<String> parseInput() {
    List<String> inputs = input.asString.split('\n').toList();
    return inputs;
  }

  @override
  int solvePart1() {
    int score = 0;
    final ruckSacks = parseInput();
    for (String ruckSack in ruckSacks) {
      String compartment1 = ruckSack.substring(0, ruckSack.length ~/ 2);
      String compartment2 =
          ruckSack.substring((ruckSack.length ~/ 2), ruckSack.length);
      Map<String, int> priorities = {};
      for (int j = 0; j < compartment2.length; j++) {
        String letter = compartment2[j];
        if (compartment1.contains(letter)) {
          priorities[letter] = (priorities[letter] ?? 0) + 1;
        }
      }
      if (priorities.isNotEmpty) {
        int ascii = priorities.keys.first.codeUnitAt(0);
        // uppercase
        if (priorities.keys.first.isUpperCase()) {
          score += (ascii % 65) + 27;
        } else {
          score += (ascii % 97) + 1;
        }
      }
    }
    return score;
  }

  @override
  int solvePart2() {
    final ruckSacks = parseInput();
    int score = 0;
    for(int i=0;i<ruckSacks.length-1;i++){
      if(i%3==0){
        String ruckSack = ruckSacks[i];
        String next = ruckSacks[i+1];
        String ultimate = ruckSacks[i+2];
        for(int j=0;j<ruckSack.length;j++){
          if(next.contains(ruckSack[j]) && ultimate.contains(ruckSack[j])){
            int ascii = ruckSack[j].codeUnitAt(0);
            // uppercase
            if (ruckSack[j].isUpperCase()) {
              score += (ascii % 65) + 27;
            } else {
              score += (ascii % 97) + 1;
            }
            break;
          }
        }
      }
    }

    return score;
  }
}
