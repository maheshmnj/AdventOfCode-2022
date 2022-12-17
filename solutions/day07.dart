import '../utils/index.dart';

class Day07 extends GenericDay {
  String? dirPath = '/';
  List<String> dirStack = [];
  Day07() : super(7);

  @override
  List<String> parseInput() {
    return input.getPerLine();
  }

  // sum of directories whose size is less than 100,000
  @override
  int solvePart1() {
    String filePattern = '[0-9]+';
    List<String> commands = parseInput();
    Map<String, int> dirSize = {};
    for (int i = 0; i < commands.length; i++) {
      String command = commands[i];
      if (command.contains('\$')) {
        if (command.contains('cd /')) {
          dirStack = ['root'];
          dirPath = getCurrentDirectory();
          dirSize[dirPath!] = 0;
        } else if (command.contains(RegExp('cd [a-z]+'))) {
          changeDirectory(command);
        } else if (command.contains('cd ..')) {
          String path = getCurrentDirectory();
          int size = dirSize[path] ?? 0;
          changeDirectoryAStepBack();

          /// todo add size to parent size
          String parent = getCurrentDirectory();
          dirSize[parent] = (dirSize[parent] ?? 0) + size;
        }
      } else
      // list files or dir in pwd
      if (command.contains(RegExp(filePattern))) {
        String size = command.split(' ').toList()[0];
        int fileSize = int.parse(size);
        String current = getCurrentDirectory();
        dirSize[current] = (dirSize[current] ?? 0) + fileSize;
      } else if (command.contains(RegExp('dir [a-z]+'))) {
        String dirName = command.getDirName(index: 1);
        String path = getCurrentDirectory() + '/' + dirName;
        dirSize[path] = 0;
      }
      print(dirSize);
    }
    int total = 0;
    for (String key in dirSize.keys) {
      int size = dirSize[key] ?? 0;
      if (size < 100000) {
        total += size;
      }
    }
    return total;
  }

  // /a/b/c/d
  // cd ..
  // /a/b/c
  void changeDirectoryAStepBack() {
    dirStack.removeLast();
    print('current dir ${getCurrentDirectory()}}');
  }

  // $ cd dirName
  void changeDirectory(String command) {
    String dirName = command.getDirName(index: 2);
    if (dirStack.isEmpty) {
      print("this will never execute");
      dirStack.add('root');
    }
    dirStack.add(dirName);
    print('current dir: ${getCurrentDirectory()}');
  }

  String getCurrentDirectory() {
    return dirStack.join('/');
  }

  @override
  int solvePart2() {
    return 0;
  }
}

extension DirectoryHelper on String {
  String getDirName({int index = 1}) {
    return this.split(' ').toList()[index];
  }
}

// data structure for file system
class File {
  String name;
  String type;
  int size;
  File(this.name, this.type, this.size);
}

class Directory {
  String name;
  List<File> files;
  List<Directory> directories;
  int size;
  Directory(this.name, this.files, this.directories, {this.size = 0});
}


/*
$ cd /  => create a root directory with name / and currentDir = ['/',[],[]]
$ ls    => skip
dir a   => create a directory with name "a", currentDir = ['/',[a],[]]
14848514 b.txt  => add a file to current directory and increase size ['/',[a], "b.txt" ] 
8504156 c.dat  => add a file to current directory and increase size ['/',[a],["b.txt","c.dat"]
dir d  => create a directory with name "d" currentDir=['/',[a,d],["b.txt","c.dat"]]
$ cd a => change current directory to "a" currentDir = ["/a",[],[]]
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
*/