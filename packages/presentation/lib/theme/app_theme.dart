import 'package:flutter/material.dart';

import 'app_color_primitives.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'app_typography_primitives.dart';

abstract final class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    textTheme: AppTypographyPrimitives.appTextTheme,
    extensions: const [
      AppColorsExtension.light,
      AppTypographyExtension.standard,
    ],
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    colorScheme: _darkColorScheme,
    textTheme: AppTypographyPrimitives.appTextTheme,
    extensions: const [
      AppColorsExtension.dark,
      AppTypographyExtension.standard,
    ],
  );

  static const _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColorPrimitives.base90,
    onPrimary: AppColorPrimitives.base30,
    primaryContainer: AppColorPrimitives.base30,
    onPrimaryContainer: AppColorPrimitives.base90,
    inversePrimary: AppColorPrimitives.base30,
    secondary: AppColorPrimitives.brand90,
    onSecondary: AppColorPrimitives.white,
    secondaryContainer: AppColorPrimitives.brand30,
    onSecondaryContainer: AppColorPrimitives.white,
    tertiary: AppColorPrimitives.brand120,
    onTertiary: AppColorPrimitives.white,
    tertiaryContainer: AppColorPrimitives.brand40,
    onTertiaryContainer: AppColorPrimitives.white,
    error: AppColorPrimitives.red90,
    onError: AppColorPrimitives.white,
    errorContainer: AppColorPrimitives.base30,
    onErrorContainer: AppColorPrimitives.base90,
    surface: AppColorPrimitives.white,
    onSurface: AppColorPrimitives.base90,
    surfaceContainerHighest: AppColorPrimitives.base10,
    surfaceContainerHigh: AppColorPrimitives.base20,
    surfaceContainer: AppColorPrimitives.base10,
    surfaceContainerLow: AppColorPrimitives.base30,
    surfaceContainerLowest: AppColorPrimitives.base40,
    surfaceBright: AppColorPrimitives.white,
    surfaceDim: AppColorPrimitives.base90a60,
    onSurfaceVariant: AppColorPrimitives.base60,
    inverseSurface: AppColorPrimitives.base90,
    onInverseSurface: AppColorPrimitives.base40,
    outline: AppColorPrimitives.brand100,
    outlineVariant: AppColorPrimitives.brand120,
    scrim: AppColorPrimitives.scrim,
    shadow: AppColorPrimitives.black,
  );

  static const _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColorPrimitives.base30,
    onPrimary: AppColorPrimitives.base90,
    primaryContainer: AppColorPrimitives.base90,
    onPrimaryContainer: AppColorPrimitives.white,
    inversePrimary: AppColorPrimitives.base90,
    secondary: AppColorPrimitives.brand90,
    onSecondary: AppColorPrimitives.white,
    secondaryContainer: AppColorPrimitives.brand30,
    onSecondaryContainer: AppColorPrimitives.white,
    tertiary: AppColorPrimitives.brand120,
    onTertiary: AppColorPrimitives.white,
    tertiaryContainer: AppColorPrimitives.brand40,
    onTertiaryContainer: AppColorPrimitives.white,
    error: AppColorPrimitives.red90,
    onError: AppColorPrimitives.white,
    errorContainer: AppColorPrimitives.base90,
    onErrorContainer: AppColorPrimitives.white,
    surface: AppColorPrimitives.base90,
    onSurface: AppColorPrimitives.base60,
    surfaceContainerHighest: AppColorPrimitives.base80,
    surfaceContainerHigh: AppColorPrimitives.base70,
    surfaceContainer: AppColorPrimitives.base90,
    surfaceContainerLow: AppColorPrimitives.base90,
    surfaceContainerLowest: AppColorPrimitives.base100,
    surfaceBright: AppColorPrimitives.base100,
    surfaceDim: AppColorPrimitives.base10a60,
    onSurfaceVariant: AppColorPrimitives.base50,
    inverseSurface: AppColorPrimitives.white,
    onInverseSurface: AppColorPrimitives.base70,
    outline: AppColorPrimitives.brand100,
    outlineVariant: AppColorPrimitives.brand120,
    scrim: AppColorPrimitives.scrim,
    shadow: AppColorPrimitives.black,
  );
}
