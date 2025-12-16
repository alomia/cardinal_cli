import 'package:cardinal/cardinal.dart';
import 'package:cardinal_cli/commands/add_command.dart';
import 'package:cardinal_cli/commands/init_command.dart';
import 'package:cardinal_cli/commands/new_command.dart';

Future<void> runCardinalCli(List<String> args) async {
  final app = CardinalApp(
    name: 'cardinal',
    description: 'Official CLI for the Cardinal framework',
    version: '0.1.0',
    configPath: '',
    commands: [NewCommand(), AddCommand(), InitCommand()],
  );

  await app.run(args);
}
