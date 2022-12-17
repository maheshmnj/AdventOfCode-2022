import '../utils/index.dart';

class Day07 extends GenericDay {
  List<String> dirStack = [];
  Map<String, int> dirStructure = {};
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
        } else if (command.contains(RegExp('cd [a-z]+'))) {
          changeDirectory(command);
        } else if (command.contains('cd ..')) {
          changeDirectoryAStepBack();
        }
      } else {
        // list files or dir in pwd
        if (command.contains(RegExp(filePattern))) {
          String size = command.split(' ').toList()[0];
          int fileSize = int.parse(size);
          String current = getCurrentDirectory();
          dirSize[current] = (dirSize[current] ?? 0) + fileSize;
          if (current != 'root') {
            dirSize['root'] = (dirSize['root'] ?? 0) + fileSize;
            String parent = getParentDirectory();
            if (parent != 'root') {
              /// todo add size to parent size
              dirSize[parent] = (dirSize[parent] ?? 0) + fileSize;
            }
          }
        } else if (command.contains(RegExp('dir [a-z]+'))) {
          String dirName = command.getDirName(index: 1);
          String path = getCurrentDirectory() + '/' + dirName;
          dirSize[path] = 0;
        }
      }
    }
    dirStructure = dirSize;
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
  }

  // $ cd dirName
  void changeDirectory(String command) {
    String dirName = command.getDirName(index: 2);
    dirStack.add(dirName);
  }

  String getCurrentDirectory() {
    return dirStack.join('/');
  }

  String getParentDirectory() {
    final temp = dirStack.toList();
    temp.removeLast();
    return temp.join('/');
  }

  @override
  int solvePart2() {
    int totalSpace = 70000000;
    int unusedSpace = totalSpace - dirStructure['root']!;
    int requiredSpace = 30000000 - unusedSpace;
    int foundSize = totalSpace;
    String directoryName = '';
    for (String path in dirStructure.keys) {
      int size = dirStructure[path] ?? 0;
      if (size < foundSize && size > requiredSpace) {
        foundSize = size;
        directoryName = path.split('/').last;
      }
    }
    print('directoryName: $directoryName');
    return foundSize;
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
