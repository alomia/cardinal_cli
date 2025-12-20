import 'dart:io';

import 'package:cardinal/cardinal.dart';
import 'package:cardinal_cli/commands/add_command.dart';
import 'package:cardinal_cli/commands/new_command.dart';
import 'package:test/test.dart';

void main() {
  late Directory tempDir;

  setUp(() {
    // Crear un directorio temporal para cada test
    tempDir = Directory.systemTemp.createTempSync('cardinal_test_');
  });

  tearDown(() {
    // Borrar el directorio temporal al final
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  group('Cardinal CLI', () {
    test('NewCommand creates project structure', () async {
      final app = CardinalApp(
        name: 'cardinal_test',
        description: 'Test CLI',
        commands: [NewCommand()],
      );

      final projectName = 'my_cli_project';
      final projectDir = Directory('${tempDir.path}/$projectName');

      // Ejecutar el comando dentro del directorio temporal
      final previous = Directory.current;
      Directory.current = tempDir;
      try {
        await app.run(['new', projectName]);
      } finally {
        Directory.current = previous;
      }

      // Verificar que se haya creado la estructura de proyecto
      expect(
        projectDir.existsSync(),
        isTrue,
        reason: 'Project directory was not created',
      );
      expect(
        Directory('${projectDir.path}/lib/commands').existsSync(),
        isTrue,
        reason: 'Commands directory was not created',
      );
      expect(
        File('${projectDir.path}/pubspec.yaml').existsSync(),
        isTrue,
        reason: 'pubspec.yaml was not created',
      );
    });

    // test('InitCommand creates cardinal.yaml', () async {
    //   final app = CardinalApp(
    //     name: 'cardinal_test',
    //     description: 'Test CLI',
    //     commands: [InitCommand()],
    //   );

    //   final previous = Directory.current;
    //   Directory.current = tempDir;
    //   try {
    //     await app.run(['init']);

    //     final configFile = File('${tempDir.path}/cardinal.yaml');
    //     expect(configFile.existsSync(), isTrue,
    //         reason: 'cardinal.yaml was not created');
    //   } finally {
    //     Directory.current = previous;
    //   }
    // });

    test('AddCommand creates a new command inside a Cardinal project', () async {
      // Crear proyecto mock para AddCommand
      final projectDir = Directory('${tempDir.path}/my_cli_project');
      projectDir.createSync(recursive: true);
      File('${projectDir.path}/cardinal.yaml').writeAsStringSync(
        'structure:\n  commands_directory: lib/commands\ngeneration:\n  file_suffix: _command.dart\n  class_suffix: Command',
      );

      final app = CardinalApp(
        name: 'cardinal_test',
        description: 'Test CLI',
        commands: [AddCommand()],
      );

      final previous = Directory.current;
      Directory.current = projectDir;
      try {
        await app.run(['add', 'hello']);

        final commandFile = File(
          '${projectDir.path}/lib/commands/hello_command.dart',
        );
        expect(
          commandFile.existsSync(),
          isTrue,
          reason: 'Command file was not created',
        );
      } finally {
        Directory.current = previous;
      }
    });
  });
}
