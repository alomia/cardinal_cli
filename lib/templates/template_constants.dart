// --------------------------------------------------------------------------
// I. CONFIGURATION AND METADATA (Configuration Files)
// --------------------------------------------------------------------------

/// Template for the core Cardinal configuration file: `cardinal.yaml`.
///
/// **Variables:** None required.
const String CARDINAL_YAML_TPL = r'''
structure:
  commands_directory: lib/commands

generation:
  file_suffix: _command.dart
  class_suffix: Command
''';


/// Template for the Dart package metadata file: `pubspec.yaml`.
///
/// **Variables:**
/// - `{{projectName}}`: The project's snake_case name (e.g., `fasty_cli`).
/// - `{{projectDescription}}`: A short sentence describing the project.
const String PUBSPEC_YAML_TPL = r'''
name: {{projectName}}
description: {{projectDescription}}
version: 1.0.0
# repository: https://github.com/my_org/my_repo

environment:
  sdk: ^3.10.1 # Latest stable Dart SDK

dependencies:
  cardinal: ^0.1.1 # Core framework dependency
  # Add other core dependencies here.

dev_dependencies:
  lints: ^6.0.0
  test: ^1.25.6
''';


// --------------------------------------------------------------------------
// II. ENTRYPOINTS AND BOOTSTRAP (Main Application Files)
// --------------------------------------------------------------------------

/// Template for the main executable file: `bin/{{projectName}}.dart`.
/// This file contains the primary `main` function that initializes the application runner.
///
/// **Variables:**
/// - `{{projectName}}`: Project name (used for imports).
/// - `{{functionName}}`: The name of the bootstrap function (e.g., `runApp`).
const String ENTRYPOINT_DART_TPL = r'''
import 'package:{{projectName}}/{{projectName}}.dart';

Future<void> main(List<String> args) async {
  await {{functionName}}(args);
}
''';


/// Template for the application bootstrap file: `lib/{{projectName}}.dart`.
/// Contains the function that configures and runs the `CardinalApp`.
///
/// **Variables:**
/// - `{{projectName}}`: Project name (used for imports and app name).
/// - `{{functionName}}`: The name of the bootstrap function (e.g., `runApp`).
const String APP_DART_TPL = r'''
import 'package:cardinal/cardinal.dart';
import 'package:{{projectName}}/commands/hello_command.dart'; // Initial example command

Future<void> {{functionName}}(List<String> args) async {
  // Configure the CLI application's metadata and commands
  final app = CardinalApp(
    name: '{{projectName}}',
    description: 'A command line application built with the Cardinal framework.', 
    version: '1.0.0', // Consider reading this from pubspec.yaml in a real app
    commands: [
      // Add initial commands here
      HelloCommand(),
    ],
  );

  await app.run(args);
}
''';


// --------------------------------------------------------------------------
// III. SCAFFOLDING (Code Generation Templates)
// --------------------------------------------------------------------------

/// Template for generating a new `CardinalCommand` file.
/// Used by the `add` command.
///
/// **Variables:**
/// - `{{commandClassName}}`: The PascalCase class name (e.g., `NewCommand`).
/// - `{{commandName}}`: The CLI command name (e.g., `new`).
const String COMMAND_DART_TPL = r'''
import 'package:cardinal/cardinal.dart';

class {{commandClassName}} extends CardinalCommand {
  {{commandClassName}}() : super(
      name: '{{commandName}}',
      description: 'A new command created by the CLI.'
      // Define your arguments and options here
    );

  @override
  Future<void> execute(CardinalContext context) async {
    print('{{commandName}} command executed!');
  }
}
''';


/// Template for generating a boilerplate test file.
///
/// **Variables:** None.
const String TEST_DART_TPL = r'''
import 'package:test/test.dart';

void main() {
  test('initial test should pass', () {
    expect(true, isTrue); 
  });
}
''';