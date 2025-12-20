import 'dart:io';

import 'package:yaml/yaml.dart';

import 'config.dart';

CardinalCliConfig loadCliConfig() {
  final file = File('cardinal.yaml');

  if (!file.existsSync()) {
    return CardinalCliConfig.defaults();
  }

  final content = file.readAsStringSync();
  final yaml = loadYaml(content);

  if (yaml is! YamlMap) {
    return CardinalCliConfig.defaults();
  }

  return CardinalCliConfig.fromMap(Map<String, dynamic>.from(yaml));
}
