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

// .2345678.  2-8
// ..34567..  3-7

// .....6...  6-6
// ...456...  4-6

// .23456...  2-6
// ...45678.  4-8

// ..23456...  2-6
// .12345678.  1-8

  @override
  int solvePart2() {

    return 0;
  }
}

