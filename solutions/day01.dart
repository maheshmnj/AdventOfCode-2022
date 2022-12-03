import '../utils/index.dart';

class Day01 extends GenericDay {
  Day01() : super(1);

  @override
  List<String> parseInput() {
    final inputs = input.asString.replaceAll('\n', ',');
    return inputs.split(',').toList();
  }

  @override
  int solvePart1() {
    final List<String> totalInputs = parseInput();
    int maxSum = 0;
    int currentSum = 0;
    for (int i = 0; i < totalInputs.length; i++) {
      String currentInput = totalInputs[i];
      // You have hit a new List of calories
      if (currentInput.isEmpty) {
        if (maxSum < currentSum) {
          maxSum = currentSum;
        }
        currentSum = 0;
      } else {
        currentSum += int.parse(currentInput);
      }
    }
    return maxSum;
  }

  @override
  int solvePart2() {
    final List<String> totalInputs = parseInput();
    int currentSum = 0;
    int fh = 0, sh = 0, th = 0; // first,second and third ...

    for (int i = 0; i < totalInputs.length; i++) {
      String currentInput = totalInputs[i];
      // You have hit a new List of calories
      // print(currentSum);
      if (currentInput.isEmpty) {
        if (currentSum > fh) {
          th = sh;
          sh = fh;
          fh = currentSum;
        } else if (currentSum > sh) {
          th = sh;
          sh = currentSum;
        } else if (currentSum > th) {
          th = currentSum;
        }
        currentSum = 0;
      } else {
        int number = int.parse(currentInput);
        currentSum += number;
      }
    }
    if (currentSum > fh) {
      th = sh;
      sh = fh;
      fh = currentSum;
    } else if (currentSum > sh) {
      th = sh;
      sh = currentSum;
    } else if (currentSum > th) {
      th = currentSum;
    }
    print('first highest = $fh');
    print('second highest = $sh');
    print('third highest = $th');
    return fh + sh + th;
  }
}
