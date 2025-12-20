import 'dart:io';

import 'package:mustache_template/mustache_template.dart';
import 'package:cardinal_cli/templates/templates.dart';
import 'package:recase/recase.dart';

import 'package:path/path.dart' as p;

/// Generates a file from a template string and writes it to disk.
Future<void> generateFile({
  required String rootPath,
  required String templateContent,
  required String relativePath, // Simplificamos de String? a String
  required Map<String, dynamic> data,
}) async {
  final template = Template(templateContent, lenient: true);
  final renderedContent = template.renderString(data);

  // Aseguramos que la ruta final sea correcta
  final finalPath = p.join(rootPath, relativePath);
  final outputFile = File(finalPath);

  // Crear directorios de forma recursiva si no existen
  await outputFile.parent.create(recursive: true);
  await outputFile.writeAsString(renderedContent);
}

/// Generates all necessary files for a new Cardinal project.
Future<void> scaffoldProject(String projectName) async {
  final functionName = 'run${projectName.pascalCase}';
  final dataRunner = {'projectName': projectName.snakeCase, 'functionName': functionName};

  // 1. cardinal.yaml
  await generateFile(
    rootPath: projectName,
    templateContent: CARDINAL_YAML_TPL,
    relativePath: 'cardinal.yaml',
    data: {},
  );

  // 2. pubspec.yaml
  await generateFile(
    rootPath: projectName,
    templateContent: PUBSPEC_YAML_TPL,
    relativePath: 'pubspec.yaml',
    data: {'projectName': projectName.snakeCase},
  );

  // 3. bin/$projectName.dart (Entrypoint)
  await generateFile(
    rootPath: projectName,
    templateContent: ENTRYPOINT_DART_TPL,
    relativePath: 'bin/${projectName.snakeCase}.dart',
    data: dataRunner,
  );

  // 4. lib/$projectName.dart (App Runner Logic)
  await generateFile(
    rootPath: projectName,
    templateContent: APP_DART_TPL,
    relativePath: 'lib/${projectName.snakeCase}.dart',
    data: dataRunner,
  );

  // 5. lib/commands/hello_command.dart (Example Command)
  await generateFile(
    rootPath: projectName,
    templateContent: COMMAND_DART_TPL,
    relativePath: 'lib/commands/hello_command.dart',
    data: {'commandName': 'hello', 'commandClassName': 'HelloCommand'},
  );

  // 6. test/projectName_test.dart
  await generateFile(
    rootPath: projectName,
    templateContent: TEST_DART_TPL,
    relativePath: 'test/${projectName.snakeCase}_test.dart',
    data: {},
  );
}
