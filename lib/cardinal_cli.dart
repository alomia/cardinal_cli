import 'package:cardinal/cardinal.dart';

import 'commands/add_command.dart';
import 'commands/init_command.dart';
import 'commands/new_command.dart';

Future<void> runCardinalCli(List<String> args) async {
  final app = CardinalApp(
    name: 'cardinal',
    description: 'Official CLI for the Cardinal framework',
    commands: [NewCommand(), AddCommand(), InitCommand()],
  );

  await app.run(args);
}
