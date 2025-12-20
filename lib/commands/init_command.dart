import 'package:cardinal/cardinal.dart';
import 'package:cardinal_cli/templates/template_constants.dart';
import 'package:cardinal_cli/utils/logger.dart';

import '../utils/file_generator.dart';

class InitCommand extends CardinalCommand {
  InitCommand()
    : super(
        name: 'init',
        description:
            'Initializes Cardinal configuration in an existing project.',
      );

  @override
  Future<void> execute(CardinalContext context) async {
    final progress = logger.progress('Initializing Project Cardinal...');
    generateFile(
      rootPath: '.',
      templateContent: CARDINAL_YAML_TPL,
      relativePath: 'cardinal.yaml',
      data: {},
    );
    progress.complete('Cardinal configuration file created successfully!');
    logger.info('File created: cardinal.yaml');
  }
}
