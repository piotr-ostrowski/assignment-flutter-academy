# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter monorepo managed with **Melos** and **FVM (Flutter Version Manager)**. The project follows a multi-package architecture with clear separation of concerns across layers.

**Flutter Version**: 3.35.2 (managed via FVM)

## Architecture

The repository is structured as a monorepo with the following packages:

- **`packages/core`**: Core domain layer containing business entities, domain models, and business logic interfaces. This is the innermost layer with no dependencies on other packages.

- **`packages/core_data`**: Data layer responsible for data sources, repositories implementations, API clients, and data models. Depends on `core` for domain contracts.

- **`packages/presentation`**: Presentation layer containing UI widgets, screens, state management, and view models. Depends on `core` for domain logic.

- **`app`**: Main Flutter application that assembles all packages and serves as the entry point. Depends on all other packages.

**Dependency Flow**: `app` → `presentation`/`core_data` → `core`

The architecture follows clean architecture principles with clear boundaries between layers.

## Common Commands

All Flutter commands must be prefixed with `fvm` to use the correct Flutter version.

### Melos Commands

```bash
# Bootstrap the monorepo (run after cloning or when adding packages)
melos bootstrap

# Run analysis across all packages
melos analyze

# Run all tests
melos test

# Run tests with coverage
melos test:coverage

# Run build_runner for code generation
melos build

# Run build_runner in watch mode
melos watch

# Format all Dart files (excludes generated files)
melos formatter

# Clean all packages
melos clean

# Get dependencies for all packages
melos get

# Upgrade all dependencies
melos upgrade

# Check for outdated packages
melos outdated

# Generate translations (for packages with flutter_localizations)
melos localize
```

### App-Specific Commands

```bash
# Run the app (from app directory)
cd app && fvm flutter run

# Run specific device
cd app && fvm flutter run -d <device_id>

# Run tests for a specific package
cd packages/core && fvm flutter test

# Run a single test file
cd packages/core && fvm flutter test test/calculator_test.dart
```

## Development Workflow

1. **Initial Setup**:
   ```bash
   fvm use 3.35.2
   melos bootstrap
   ```

2. **Before Making Changes**:
   - Run `melos analyze` to ensure code quality
   - Run `melos test` to verify existing tests pass

3. **Adding Dependencies**:
   - Add dependencies to the appropriate package's `pubspec.yaml`
   - Run `melos get` or `cd <package> && fvm flutter pub get`
   - If adding to multiple packages, run `melos bootstrap` to link workspace dependencies

4. **Code Generation** (for packages using build_runner):
   - Run `melos build` for one-time generation
   - Run `melos watch` during development for automatic regeneration

5. **Before Committing**:
   - Run `melos formatter` to format all code
   - Run `melos analyze` to check for issues
   - Run `melos test` to ensure all tests pass

## Key Conventions

- **FVM Usage**: Always use `fvm flutter` instead of `flutter` to ensure version consistency
- **Generated Files**: Files ending in `.g.dart`, `.freezed.dart`, and `.module.dart` are generated and should not be manually edited
- **Package Resolution**: All packages use `resolution: workspace` for monorepo dependency management
- **Linting**: All packages follow `flutter_lints` rules defined in `analysis_options.yaml`

## Testing

- Test files are located in each package's `test/` directory
- Run all tests with `melos test`
- Run tests for a specific package by navigating to that package and running `fvm flutter test`
- Generate coverage reports with `melos test:coverage`

## Build Runner

Some packages may use `build_runner` for code generation (e.g., for JSON serialization, dependency injection, or state management). The Melos scripts automatically detect and run build_runner only in packages that depend on it.
