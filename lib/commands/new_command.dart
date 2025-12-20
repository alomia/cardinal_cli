import 'dart:io';

import 'package:cardinal/cardinal.dart';

import '../utils/file_generator.dart';
import '../utils/logger.dart';
import '../utils/project_creation.dart';

class NewCommand extends CardinalCommand {
  NewCommand()
    : super(
        name: 'new',
        description: 'Create a new Cardinal project.',
        arguments: [
          stringArgument(
            name: 'name',
            help: 'The name of the new project directory',
            required: true,
          ),
        ],
      );

  @override
  Future<void> execute(CardinalContext context) async {
    final name = context.argument<String>('name');
    final directory = Directory(name!);

    if (directory.existsSync()) {
      logger.err('Directory "$name" already exists.');
      logger.info(
        'Please choose a different name or delete the existing directory to proceed.',
      );
      exit(1);
    }

    // -------------------------------------------------------------
    // TASK 1: Creating files
    final createProgress = logger.progress('Generating base project structure');
    await createProject(name, createProgress);
    await scaffoldProject(name);
    createProgress.complete('Base project structure generated.');

    // -------------------------------------------------------------
    // TASK 2: Installation of dependencies
    final installProgress = logger.progress(
      'Installing required dependencies (dart pub get)',
    );
    await installDependencies(name, installProgress);
    installProgress.complete('All dependencies installed.');

    logger.success('Project "$name" created successfully!');
  }
}
