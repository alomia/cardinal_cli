// lib/utils/project_creation.dart
import 'dart:io';

import 'package:cardinal_cli/utils/logger.dart';
import 'package:mason_logger/mason_logger.dart';

/// Initializes a new Dart console project using 'dart create'.
Future<ProcessResult> createProject(
  String projectName,
  Progress progressLogger,
) async {
  final createResult = await Process.run(
    'dart', 
    ['create', projectName, '--template', 'console', '--no-pub'], 
    runInShell: true,
  );

  if (createResult.exitCode != 0) {
    progressLogger.fail('Failed to run "dart create".');
    // Muestra el error de stdout/stderr para depuración
    logger.err(createResult.stderr); 
    exit(1);
  }

  return createResult;
}

/// Installs project dependencies using 'dart pub get'.
Future<void> installDependencies(
  String projectName,
  Progress progressLogger,
) async {
  final installResult = await Process.run(
    'dart',
    ['pub', 'get'],
    workingDirectory: projectName,
    runInShell: true,
  );
  
  if (installResult.exitCode != 0) {
    progressLogger.fail('Failed to install dependencies.');
    
    // Proporcionar información más útil en caso de fallo
    logger.err(
      'Failed to fetch dependencies (exit code ${installResult.exitCode}).',
    );
    logger.info('Stderr: ${installResult.stderr}'); 
    logger.info(
      'Please check your network connection or run the following command manually:',
    );
    logger.write('  \$ cd $projectName && dart pub get\n');
    exit(1);
  }
}
