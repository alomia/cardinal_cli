import 'dart:io';

import 'package:cardinal/cardinal.dart';
import 'package:recase/recase.dart';

import '../templates/templates.dart';
import '../utils/config_loader.dart';
import '../utils/file_generator.dart';
import '../utils/logger.dart';
import '../utils/project_locator.dart';

class AddCommand extends CardinalCommand {
  AddCommand()
    : super(
        name: 'add',
        description:
            'Generates a new command inside the current Cardinal project.',
        arguments: [
          stringArgument(
            name: 'name',
            help: 'The name of the command to generate',
            required: true,
          ),
        ],
      );

  @override
  Future<void> execute(CardinalContext context) async {
    final name = context.argument<String>('name')!;
    final config = loadCliConfig();
    final projectRoot = findProjectRoot();

    if (projectRoot == null) {
      logger.err('No cardinal.yaml found.');
      logger.info('Run this command inside a Cardinal project.');
      exit(1);
    }

    final commandClassName = ReCase('$name${config.classSuffix}').pascalCase;

    final progress = logger.progress('Creating command: ${name.pascalCase}');
    await generateFile(
      rootPath: projectRoot.path,
      templateContent: COMMAND_DART_TPL,
      relativePath:
          '${config.commandsDirectory}/${name.snakeCase}${config.fileSuffix}',
      data: {'commandName': name, 'commandClassName': commandClassName},
    );

    progress.complete('Command "$name" created successfully.');
    logger.info('File created: lib/commands/${name}_command.dart');
  }
}
