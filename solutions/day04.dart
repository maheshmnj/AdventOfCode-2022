import '../utils/index.dart';

class Day04 extends GenericDay {
  Day04() : super(4);

  @override
  List<String> parseInput() {
    List<String> assignments = input.asString.split('\n').toList();
    return assignments;
  }

  @override
  int solvePart1() {
    final assignments = parseInput();
    int count =0;
    for(int i=0;i< assignments.length-1;i++){
      final assignment = assignments[i].split(RegExp(r'[,-]')).map((e) => int.parse(e)).toList();
      if(assignment[0]<=assignment[2] && assignment[1]>=assignment[3]){
        count+=1;
      }else if(assignment[0]>=assignment[2] && assignment[1]<=assignment[3]){
        count+=1;
      }
    }
    return count;
  }

  @override
  int solvePart2() {
    final assignments = parseInput();
    int count =0;
    for(int i=0;i< assignments.length-1;i++){
      final assignment = assignments[i].split(RegExp(r'[,-]')).map((e) => int.parse(e)).toList();
      if(!(assignment[0] < assignment[2] && assignment[1] < assignment[2]) &&
         !(assignment[0] > assignment[3] && assignment[0] > assignment[3])){
        count+=1;
      }
    }
    return count;
  }
}

