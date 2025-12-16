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
        arguments: {'name': stringArgument(help: 'name project')},
      );

  @override
  Future<void> execute(CardinalContext context) async {
    final projectName = context.argument('name');
    final directory = Directory(projectName!);

    if (directory.existsSync()) {
      logger.err('Directory "$projectName" already exists.');
      logger.info('Please choose a different name or delete the existing directory to proceed.');
      exit(1);
    }

    // -------------------------------------------------------------
    // TASK 1: Creating files
    final createProgress = logger.progress('Generating base project structure');
    await createProject(projectName, createProgress);
    await scaffoldProject(projectName);
    createProgress.complete('Base project structure generated.');

    // -------------------------------------------------------------
    // TASK 2: Installation of dependencies
    final installProgress = logger.progress('Installing required dependencies (dart pub get)');
    await installDependencies(projectName, installProgress);
    installProgress.complete('All dependencies installed.');

    logger.success('Project "$projectName" created successfully!');
  }
}
