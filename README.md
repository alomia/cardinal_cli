<img src="https://raw.githubusercontent.com/alomia/cardinal_cli/main/assets/github-header.png" alt="Cardinal header" />

# Cardinal CLI

**The official command-line tool for the Cardinal Framework.**

A powerful and zero-setup CLI for bootstrapping, managing, and generating files for your Cardinal-based command-line tools.

## Key Features

- Quick Start: Scaffold a complete, runnable Cardinal project structure in seconds using cardinal new.

- Code Generation: Easily add new commands and file templates to an existing project with cardinal add.

- Initialization: Configure the full Cardinal structure within any existing Dart project using cardinal init.

- Zero Boilerplate: Focused on Developer Experience (DX) to let you concentrate on your command logic, not setup.

## Installation

To start building your own CLI with the Cardinal Framework, activate the official CLI globally via the Dart package manager:

```bash
dart pub global activate cardinal_cli
```
*(Note: Requires a Dart SDK version compatible with the framework requirements.)*

## Quick Usage and Commands

The Cardinal CLI offers three core commands to manage your project lifecycle.
### 1. Create a New Project (`new`)

This is the fastest way to start. The `new` command scaffolds the complete directory structure, sets up the `pubspec.yaml`, and generates a runnable example command.

```bash
# Usage: cardinal new <project_name>
cardinal new my_awesome_cli

# Navigate to your new project and run it
cd my_awesome_cli
dart run
```

### 2. Initialize an Existing Project (`init`)

If you have an existing Dart project and wish to incorporate Cardinal, use `init` to create the necessary core file structure and configurations.

```bash
# Run inside the root folder of your existing Dart project
cardinal init
```


### 3. Add New Commands (`add`)

Use `add` to automatically generate the boilerplate for a new command class. The CLI creates the file in `lib/commands/` and registers it in the main command runner.

```bash
# Usage: cardinal add command <command_name>
cardinal add login
```

### 4. Full Command List

Your CLI supports the following primary commands:

| Command      | Description                                                                    |
|:-------------|:-------------------------------------------------------------------------------|
| `new`        | Creates a complete, ready-to-run new project structure.                        |
| `init`       | Initializes and configures the core Cardinal structure in an existing project. |
| `add`        | Adds a new template to the current project.                                    |

## Framework Dependency

This CLI tool is the companion to the core library. To learn about defining arguments, options, and the execution context, please refer to the main package documentation:

<a href="https://pub.dev/packages/cardinal">Cardinal Framework on pub.dev</a>

## Contributing and Support

Please refer to the main <a href="https://github.com/alomia/cardinal">Cardinal Framework repository</a> for details on how to report issues, contribute code, or view the overall architecture.
