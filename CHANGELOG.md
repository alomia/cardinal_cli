## [0.3.0]

### Added
- Support for `cardinal.yaml` configuration file.
- Configurable command generation paths and naming conventions.
- Automatic Cardinal project root detection.
- Improved logging powered by `mason_logger`.

### Fixed
- Incorrect file generation when running commands outside the project root.
- Project scaffolding issues when using invalid Dart project names.
- Multiple path resolution edge cases during command generation.

## [0.2.0]

### Added
- Initial release of Cardinal CLI.
- Commands added: `init`, `new`, and `add` for project setup and component creation.
- Basic file generation utility and logging.
- Initial project structure, including `pubspec.yaml`, `analysis_options.yaml`, and `cardinal.yaml`.
