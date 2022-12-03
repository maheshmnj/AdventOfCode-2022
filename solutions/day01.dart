import '../utils/index.dart';

class Day01 extends GenericDay {
  Day01() : super(1);

  @override
  parseInput() {
    
  }

  @override
  int solvePart1() {
    final inputs = input.asString.replaceAll('\n', ',');
    final List<String> totalInputs = inputs.split(',').toList();
    int maxSum = 0;
    int currentSum=0;
    for(int i=0;i<totalInputs.length;i++){
      String currentInput = totalInputs[i];
      if(currentInput.isEmpty){
        if(maxSum < currentSum){
          maxSum = currentSum;
        }
        currentSum = 0;
      }else{
        currentSum += int.parse(currentInput);
      }
    }
    return maxSum;
    return 0;
  }

  @override
  int solvePart2() {

    return 0;
  }
}

