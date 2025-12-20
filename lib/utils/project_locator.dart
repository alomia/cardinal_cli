import 'dart:io';

Directory? findProjectRoot([Directory? start]) {
  var current = start ?? Directory.current;

  while (true) {
    final configFile = File('${current.path}/cardinal.yaml');
    if (configFile.existsSync()) {
      return current;
    }

    final parent = current.parent;
    if (parent.path == current.path) {
      return null;
    }

    current = parent;
  }
}
