import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

import 'app_typography_primitives.dart';

part 'app_typography.g.theme.dart';

@themeExtensions
class AppTypographyExtension extends ThemeExtension<AppTypographyExtension>
    with _$AppTypographyExtensionMixin {
  const AppTypographyExtension({
    // Headings
    required this.headingLarge,
    required this.headingMedium,
    required this.headingSmall,
    // Titles
    required this.titleXLarge,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    // Labels — medium weight
    required this.labelXXLarge,
    required this.labelXLarge,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    // Labels — light weight
    required this.labelXXLargeLight,
    // Body
    required this.bodyXLarge,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    // Special
    required this.textSizePopup,
  });

  // Headings
  final TextStyle headingLarge;
  final TextStyle headingMedium;
  final TextStyle headingSmall;
  // Titles
  final TextStyle titleXLarge;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  // Labels — medium weight
  final TextStyle labelXXLarge;
  final TextStyle labelXLarge;
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;
  // Labels — light weight
  final TextStyle labelXXLargeLight;
  // Body
  final TextStyle bodyXLarge;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  // Special
  final TextStyle textSizePopup;

  static const standard = AppTypographyExtension(
    headingLarge: AppTypographyPrimitives.h1,
    headingMedium: AppTypographyPrimitives.h2,
    headingSmall: AppTypographyPrimitives.h3,
    titleXLarge: AppTypographyPrimitives.tile1,
    titleLarge: AppTypographyPrimitives.h4,
    titleMedium: AppTypographyPrimitives.h5,
    titleSmall: AppTypographyPrimitives.label7,
    labelXXLarge: AppTypographyPrimitives.label1,
    labelXLarge: AppTypographyPrimitives.label2,
    labelLarge: AppTypographyPrimitives.label3,
    labelMedium: AppTypographyPrimitives.label5,
    labelSmall: AppTypographyPrimitives.label9,
    labelXXLargeLight: AppTypographyPrimitives.label1Light,
    bodyXLarge: AppTypographyPrimitives.body1,
    bodyLarge: AppTypographyPrimitives.body2,
    bodyMedium: AppTypographyPrimitives.note1,
    bodySmall: AppTypographyPrimitives.note3,
    textSizePopup: AppTypographyPrimitives.note5,
  );
}
