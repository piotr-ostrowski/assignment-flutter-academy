# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter monorepo managed with **Melos** and **FVM (Flutter Version Manager)**. The project follows a multi-package architecture with clean architecture principles.

**Flutter Version**: 3.35.2 (managed via FVM)

## Architecture

The repository is structured as a monorepo with the following packages:

- **`packages/core`**: Domain layer — business entities, domain models, abstract repository interfaces. No dependencies on other packages.

- **`packages/core_data`**: Data layer — repository implementations, API clients, DI module. Depends on `core`.

- **`packages/presentation`**: Presentation layer — UI screens, Cubits, routing, theme system. Depends on `core`.

- **`app`**: Main Flutter application — DI setup, entry point. Depends on all other packages.

**Dependency Flow**: `app` → `presentation` + `core_data` → `core`

## Key Technologies

| Concern | Library |
|---|---|
| State management | `flutter_bloc` (Cubit pattern) |
| Dependency injection | `get_it` + `injectable` |
| Routing | `auto_route` |
| Immutable models | `freezed` |
| JSON serialization | `json_serializable` |
| Reactive streams | `rxdart` |
| Theme generation | `theme_extensions_builder` |

## Package Structure

### packages/core
```
lib/
├── models/
│   ├── photovoltaic/        # PhotovoltaicModel, PhotovoltaicStatus (enum), PhotovoltaicExceptionState
│   └── period_stats/        # CurrentStatsByPeriod
└── repositories/
    └── photovoltaic_repository.dart  # Abstract interface
```

### packages/core_data
```
lib/
├── api/
│   └── api_service.dart              # @lazySingleton — loads JSON from assets
├── di/
│   ├── core_data_module.dart         # @InjectableInit.microPackage
│   └── core_data_module.module.dart  # GENERATED
└── repositories/
    └── photovoltaic_repository_impl.dart  # @LazySingleton
```

Assets: `assets/photovoltaic_sample.json` (simulated API data)

### packages/presentation
```
lib/
├── theme/
│   ├── app_color_primitives.dart     # Raw Color hex values
│   ├── app_colors.dart               # AppColorsExtension (hierarchical: basic/action/critical/special)
│   ├── app_colors.g.theme.dart       # GENERATED
│   ├── app_typography_primitives.dart # Raw TextStyle + appTextTheme
│   ├── app_typography.dart           # AppTypographyExtension (19 TextStyle fields)
│   ├── app_typography.g.theme.dart   # GENERATED
│   ├── app_sizing.dart               # Spacing/radius/icon size constants
│   └── app_theme.dart                # AppTheme.lightTheme / darkTheme
├── router/
│   ├── app_router.dart               # @AutoRouterConfig
│   └── app_router.gr.dart            # GENERATED
├── screens/
│   ├── dashboard/                    # Tab container with AutoTabsRouter
│   ├── home/                         # HomeCubit + HomeScreen
│   ├── notifications/
│   ├── analysis/
│   ├── vicare_plus/
│   └── settings/                     # SettingsScreen + section_header_item + menu_item
└── components/
    ├── main_navigation_bar.dart       # Bottom nav with SVG icons
    └── tile_card.dart                 # Reusable card widget
```

### app
```
lib/
├── main.dart                          # MaterialApp.router setup
└── di/
    ├── injector.dart                  # configureDependencies()
    └── injector.config.dart           # GENERATED
```

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
```

## State Management

Uses **Cubit** pattern from `flutter_bloc`. Each screen has its own Cubit:

```dart
// Example: HomeCubit
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(PhotovoltaicRepository _repository) : super(const HomeState.initial());

  void loadData() { ... }
}
```

States use `freezed` with sealed classes. Cubit is created via `BlocProvider` in the screen and injected via `get_it`.

## Routing

Uses `auto_route`. Routes are defined in `packages/presentation/lib/router/app_router.dart`.

Navigation structure:
- Root: `DashboardScreen` with bottom tabs (`AutoTabsRouter`)
- Tabs: Home, Notifications, Analysis, ViCare Plus, Settings
- Each tab is a flow with nested routes

After modifying routes, regenerate with `melos build`.

## Dependency Injection

Uses `get_it` + `injectable`. Setup:

1. `app/lib/di/injector.dart` — root `@InjectableInit` entry point
2. `packages/core_data/lib/di/core_data_module.dart` — `@InjectableInit.microPackage` for data layer
3. Annotations: `@LazySingleton`, `@lazySingleton`, `@injectable`

After adding/changing injected classes, run `melos build` to regenerate `injector.config.dart` and `*.module.dart`.

## Theme System

Access in widgets via generated `BuildContext` extensions:

```dart
// Colors
context.appColors.basic.surface.default_
context.appColors.action.content.default_
context.appColors.special.solar

// Typography
context.appTypography.h1
context.appTypography.body1

// Sizing
AppSizing.spacing16
AppSizing.radiusMedium
```

Defined in `packages/presentation/lib/theme/`. After changing theme files, run `melos build` to regenerate `*.g.theme.dart` files.

## Code Generation

| Generated file | Source | Tool |
|---|---|---|
| `*.freezed.dart` | Classes annotated `@freezed` | freezed |
| `*.g.dart` | Classes with `@JsonSerializable` | json_serializable |
| `app_router.gr.dart` | `@AutoRouterConfig` | auto_route_generator |
| `injector.config.dart` | `@InjectableInit` | injectable_generator |
| `core_data_module.module.dart` | `@InjectableInit.microPackage` | injectable_generator |
| `app_colors.g.theme.dart` | `@themeExtensions` on AppColorsExtension | theme_extensions_builder |
| `app_typography.g.theme.dart` | `@themeExtensions` on AppTypographyExtension | theme_extensions_builder |

**Never manually edit generated files.** Run `melos build` after any changes to annotated source files.

## Key Conventions

- **FVM Usage**: Always use `fvm flutter` instead of `flutter`
- **Generated Files**: Do not edit `.g.dart`, `.freezed.dart`, `.gr.dart`, `.config.dart`, `.module.dart`
- **Package Resolution**: All packages use `resolution: workspace`
- **Linting**: `flutter_lints` + `custom_lint`, page width 120, strict mode enabled
- **Line width**: 120 characters (configured in `analysis_options.yaml`)

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
   - Add to the appropriate package's `pubspec.yaml`
   - Run `melos bootstrap` to link workspace dependencies

4. **After Modifying Annotated Classes** (routes, DI, freezed models, theme):
   - Run `melos build` to regenerate

5. **Before Committing**:
   - Run `melos formatter`
   - Run `melos analyze`
   - Run `melos test`

## Testing

- Test files in each package's `test/` directory
- `packages/core_data/test/` uses `mockito` for repository mocks
- Run all tests: `melos test`
- Run coverage: `melos test:coverage`
