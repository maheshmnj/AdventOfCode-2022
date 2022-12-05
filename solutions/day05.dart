import '../utils/extensions.dart';
import '../utils/index.dart';

class Day05 extends GenericDay {
  Day05() : super(5);

  @override
  Map<int, List<String>> parseInput() {
    final stacks = <int, List<String>>{};
    for (int i = 0; i < 9; i++) {
      String line1 = input.getPerLine()[i];
      // final list = line1.split(RegExp(r'[\s\[\]]')).toList();
      for (int i = 0; i < line1.length; i++) {
        if (line1[i].isUpperCase()) {
          int stackIndex = ((i ~/ 4) + 1);
          if (stacks[stackIndex] == null) {
            stacks[stackIndex] = [];
          }
          stacks[stackIndex]!.add(line1[i]);
        }
      }
    }
    return stacks;
  }

  /// will reverse the order
  Map<int, List<String>> move(
      int move, int from, int to, Map<int, List<String>> stack) {
    for (int i = 0; i < move; i++) {
      String popped = stack[from]!.removeAt(0);
      stack[to] = [popped, ...stack[to]!];
    }
    return stack;
  }

  Map<int, List<String>> moveWithFixOrder(
      int move, int from, int to, Map<int, List<String>> stack) {
    List<String> tempList=[];
    for (int i = 0; i < move; i++) {
      String popped = stack[from]!.removeAt(0);
      tempList.add(popped);
    }
    tempList = tempList.reversed.toList();
    for(int i=0;i<tempList.length;i++){
      stack[to] = [tempList[i], ...stack[to]!];
    }
    return stack;
  }

  @override
  int solvePart1() {
    Map<int, List<String>> stack = parseInput();
    // Read instructions
    final inputLines = input.getPerLine();
    for (String instruction in inputLines) {
      if (instruction.contains('move')) {
        List<String> numbers = instruction.split(' ').toList();
        int count = int.parse(numbers[1]);
        int from = int.parse(numbers[3]);
        int to = int.parse(numbers[5]);
        stack = move(count, from, to, stack);
      }
    }
    String output = '';
    for (int i = 1; i < 10; i++) {
      output += stack[i]![0];
    }
    print(output);
    return 0;
  }
  void printStack(Map<int, List<String>> stack){
    for(int i = 1; i < 10; i++) {
     print('$i:${stack[i]}');
    }
  }
  @override
  int solvePart2() {
     Map<int, List<String>> stack = parseInput();
    // Read instructions
    final inputLines = input.getPerLine();
    for (String instruction in inputLines) {
      if (instruction.contains('move')) {
        List<String> numbers = instruction.split(' ').toList();
        int count = int.parse(numbers[1]);
        int from = int.parse(numbers[3]);
        int to = int.parse(numbers[5]);
        stack = moveWithFixOrder(count, from, to, stack);
      }
    }
    String output = '';
    for(int i = 1; i < 10; i++) {
     output+=stack[i]![0];
    }
    print(output);
    return 0;
  }
}
