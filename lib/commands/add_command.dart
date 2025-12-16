import 'package:cardinal/cardinal.dart';
import 'package:recase/recase.dart';

import '../templates/templates.dart';
import '../utils/file_generator.dart';
import '../utils/logger.dart';

class AddCommand extends CardinalCommand {
  AddCommand()
    : super(
        name: 'add',
        description: 'Adds a new CardinalCommand',
        arguments: {'name': stringArgument(help: 'name command')},
      );

  @override
  Future<void> execute(CardinalContext context) async {
    final name = context.argument('name')!;
    final commandClassName = ReCase(
      '$name${context.project.classSuffix}',
    ).pascalCase;

    final progress = logger.progress('Creating command: ${name.pascalCase}');
    await generateFile(
      rootPath: '.',
      templateContent: COMMAND_DART_TPL,
      relativePath:
          '${context.project.commandsDir}/${name.snakeCase}${context.project.fileSuffix}',
      data: {'commandName': name, 'commandClassName': commandClassName},
    );

    progress.complete('Command "$name" created successfully.');
    logger.info('File created: lib/commands/${name}_command.dart');
  }
}
