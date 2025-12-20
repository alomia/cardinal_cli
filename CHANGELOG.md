## [0.3.1]

### Updated
- Updated dependency on `cardinal` framework to `^0.4.0`.
- Minor adjustments to templates to reflect framework API changes.

### Added
- Basic tests for `NewCommand` and `AddCommand` to validate project scaffolding and command generation.
- Temporary test for `InitCommand` (currently marked as pending due to path handling).

### Fixed
- Resolved minor inconsistencies in project generation templates.


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
