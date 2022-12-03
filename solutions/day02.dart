import '../utils/index.dart';

class Day02 extends GenericDay {
  Day02() : super(2);
  // Opp          Me  Score
  // A - Rock    - X - 1
  // B - paper   - Y - 2
  // C - Scissor - Z - 3

  // win = +6, draw = +3,lost = 0

  @override
  Set<Pair> parseInput() {
    var pairs = Set<Pair>();
    final List<String> inputs = input.asString.split('\n').toList();
    for (int i = 0; i < inputs.length - 1; i++) {
      final pair = inputs[i].split(' ').toList();
      pairs.add(Pair(pair[0], pair[1]));
    }
    return pairs;
  }

  @override
  int solvePart1() {
    final pairs = parseInput();
    int winScore = 6;
    int drawScore = 3;
    int loseScore = 0;
    int totalScore = 0;
    for (int i = 0; i < pairs.length; i++) {
      final opponent = pairs.elementAt(i).first;
      final player = pairs.elementAt(i).second;
      Game result = fight(opponent, player);
      final int bonus = toolScore(player);
      if(result ==Game.win){
        totalScore+=winScore+bonus;
      }else if(result == Game.lose){
        totalScore+=loseScore+bonus;
      }else{
        totalScore+=drawScore+bonus;
      }
    }
    return totalScore;
  }
  int toolScore(String player){
    switch (player) {
      case 'X':
      return 1;
      case 'Y':
      return 2;
      default:
      return 3;
    }
  }
  // returns player2 game result win,loose, draw
  Game fight(String player1, player2) {
    if (isDraw(player1, player2)) {
      return Game.draw;
    } else {
      if (player1 == 'A') {
        // A-Y
        if (player2 == 'Y') {
            return Game.win;
        } else {
          // A-Z
          return Game.lose;
        }
      } else if (player1 == 'B') {
        // B-X
        if (player2 == 'X') {
          return Game.lose;
        } else {
          // B-Z
          return Game.win;
        }
      } else {
        // C-X
        if (player2 == 'X') {
          return Game.win;
        } else {
          // C-Y
          return Game.lose;

        }
      }
    }
  }

  bool isDraw(String player1, String player2) {
    if ((player1 == 'A' && player2 == 'X') ||
        (player1 == 'B' && player2 == 'Y') ||
        (player1 == 'C' && player2 == 'Z')) {
      return true;
    }
    return false;
  }

  @override
  int solvePart2() {
    return 0;
  }
}

enum Game { win, lose, draw }

class Pair {
  final String first;
  final String second;

  Pair(this.first, this.second);
}
