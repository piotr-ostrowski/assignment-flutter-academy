# Theme Extensions Implementation

Dokument opisuje sposób implementacji systemu motywów (Theme) w projekcie, ze szczególnym uwzględnieniem `AppColorsExtension` i `AppTypographyExtension`.

## Użyte biblioteki

### `theme_extensions_builder` + `theme_extensions_builder_annotation`

- **pub.dev**: [theme_extensions_builder](https://pub.dev/packages/theme_extensions_builder)
- **Wersja**: `^5.0.0`

Biblioteka do generowania kodu dla Flutter `ThemeExtension`. Eliminuje konieczność ręcznego pisania metod `copyWith`, `lerp`, `==` i `hashCode`, które są wymagane przez Flutter przy tworzeniu własnych rozszerzeń motywu.

Zależności w `core_ui/pubspec.yaml`:

```yaml
dependencies:
  theme_extensions_builder_annotation: ^5.0.0

dev_dependencies:
  build_runner: ^2.7.1
  theme_extensions_builder: ^5.0.0
```

---

## Mechanizm działania

### 1. Adnotacja `@themeExtensions`

Klasa rozszerzenia motywu musi być oznaczona adnotacją `@themeExtensions` z pakietu `theme_extensions_builder_annotation` oraz miksować wygenerowany mixin `_$ThemeExtensionMixin`.

```dart
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'app_colors.g.theme.dart'; // wskazuje plik generowany przez build_runner

@themeExtensions
class AppColorsExtension extends ThemeExtension<AppColorsExtension>
    with _$ThemeExtensionMixin {
  // ...
}
```

### 2. Generowanie kodu

Po uruchomieniu `build_runner` generowany jest plik `*.g.theme.dart` zawierający mixin z implementacją:

- `copyWith(...)` — tworzenie kopii z nadpisanymi polami
- `lerp(other, t)` — interpolacja między dwoma stanami (używana przy animacjach motywu)
- `operator ==` i `hashCode` — porównywanie obiektów

Generowanie kodu:

```bash
melos build --no-select
# lub z poziomu pakietu:
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Extension na `BuildContext`

Generator automatycznie tworzy extension na `BuildContext`, który umożliwia wygodny dostęp do rozszerzenia motywu:

```dart
extension AppColorsExtensionBuildContext on BuildContext {
  AppColorsExtension get appColors =>
      Theme.of(this).extension<AppColorsExtension>()!;
}

extension AppTypographyExtensionBuildContext on BuildContext {
  AppTypographyExtension get appTypography =>
      Theme.of(this).extension<AppTypographyExtension>()!;
}
```

---

## Struktura `AppColorsExtension`

Kolory zorganizowane są w hierarchię semantycznych klas:

```
AppColorsExtension
├── BasicColors
│   ├── BasicSurfaceColors
│   ├── BasicBorderColors
│   ├── BasicContentColors
│   └── BasicBackgroundColors
├── ActionColors
│   ├── ActionSurfaceColors
│   ├── ActionBorderColors
│   └── ActionContentColors
├── CriticalColors
│   ├── CriticalBorderColors
│   ├── CriticalSurfaceColors
│   └── CriticalContentColors
└── SpecialColors
```

Klasy pośrednie (np. `BasicColors`, `ActionColors`) są zwykłymi Dart class — nie są oznaczone żadną adnotacją. Generator obsługuje tylko klasę główną oznaczoną `@themeExtensions`.

Rozszerzenie definiuje dwa gotowe warianty jako stałe:

```dart
static const light = AppColorsExtension(...);
static const dark  = AppColorsExtension(...);
```

---

## Struktura `AppTypographyExtension`

Typografia to płaska lista `TextStyle`, pogrupowana semantycznie:

```
AppTypographyExtension
├── Headings:  headingLarge, headingMedium, headingSmall
├── Titles:    titleXLarge, titleLarge, titleMedium, titleSmall
├── Labels:    labelXXLarge ... labelSmall (medium weight)
├── Labels:    labelXXLargeLight ... labelSmallLight (light weight)
├── Body:      bodyXLarge, bodyLarge, bodyMedium, bodySmall
└── Special:   textSizePopup
```

Wartości pobierane są z `AppTypographyPrimitives` — klasy zawierającej definicje `TextStyle` oparte na fontach projektu. Rozszerzenie definiuje jeden wariant:

```dart
static const standard = AppTypographyExtension(...);
```

Typografia nie rozróżnia wariantów light/dark — style tekstowe są wspólne dla obu motywów.

---

## Rejestracja w `ThemeData`

Oba rozszerzenia rejestrowane są w `AppTheme` przez pole `extensions` w `ThemeData`:

```dart
// packages/core/core_ui/lib/theme/app_theme.dart

abstract class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    textTheme: AppTypographyPrimitives.appTextTheme,
    extensions: [
      AppColorsExtension.light,      // wariant jasny
      AppTypographyExtension.standard,
    ],
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    textTheme: AppTypographyPrimitives.appTextTheme,
    extensions: [
      AppColorsExtension.dark,       // wariant ciemny
      AppTypographyExtension.standard,
    ],
  );
}
```

---

## Użycie w widgetach

Dostęp przez wygenerowane extension na `BuildContext`:

```dart
// Kolory
final colors = context.appColors;
Container(color: colors.basic.surface.default_);

// Typografia
final typography = context.appTypography;
Text('Tytuł', style: context.appTypography.titleLarge);
```

---

## Lokalizacja plików

```
packages/core/core_ui/lib/theme/
├── app_theme.dart                  # ThemeData (light + dark)
├── app_colors.dart                 # AppColorsExtension + klasy semantyczne
├── app_colors.g.theme.dart         # WYGENEROWANY — copyWith, lerp, ==, hashCode, BuildContext ext.
├── app_typography.dart             # AppTypographyExtension
├── app_typography.g.theme.dart     # WYGENEROWANY — copyWith, lerp, ==, hashCode, BuildContext ext.
├── app_color_primitives.dart       # Surowe wartości Color (paleta)
├── app_typography_primitives.dart  # Surowe TextStyle + appTextTheme
└── app_sizing.dart                 # Stałe wymiarów/odstępów
```
