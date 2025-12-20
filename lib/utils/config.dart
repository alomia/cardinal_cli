class CardinalCliConfig {
  final String commandsDirectory;
  final String fileSuffix;
  final String classSuffix;

  const CardinalCliConfig({
    required this.commandsDirectory,
    required this.fileSuffix,
    required this.classSuffix,
  });

  factory CardinalCliConfig.defaults() {
    return const CardinalCliConfig(
      commandsDirectory: 'lib/commands',
      fileSuffix: '_command.dart',
      classSuffix: 'Command',
    );
  }

  factory CardinalCliConfig.fromMap(Map<String, dynamic> map) {
    return CardinalCliConfig(
      commandsDirectory:
          map['structure']?['commands_directory'] ?? 'lib/commands',
      fileSuffix:
          map['generation']?['file_suffix'] ?? '_command.dart',
      classSuffix:
          map['generation']?['class_suffix'] ?? 'Command',
    );
  }
}
