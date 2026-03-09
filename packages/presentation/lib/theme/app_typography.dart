import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

import 'app_typography_primitives.dart';

part 'app_typography.g.theme.dart';

@themeExtensions
class AppTypographyExtension extends ThemeExtension<AppTypographyExtension>
    with _$AppTypographyExtensionMixin {
  const AppTypographyExtension({
    // Display
    required this.d1,
    required this.d2,
    required this.d3,
    // Heading
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.h5,
    // Body
    required this.body1,
    required this.body2,
    // Tile
    required this.tile1,
    required this.tile2,
    required this.tile7,
    // Note
    required this.note1,
    required this.note2,
    required this.note3,
    required this.note4,
    required this.note5,
    // Label
    required this.label1,
    required this.label2,
    required this.label3,
    required this.label4,
    required this.label5,
    required this.label6,
    required this.label7,
    required this.label8,
    required this.label9,
    required this.label10,
    required this.label1Light,
  });

  // Display
  final TextStyle d1;
  final TextStyle d2;
  final TextStyle d3;
  // Heading
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle h5;
  // Body
  final TextStyle body1;
  final TextStyle body2;
  // Tile
  final TextStyle tile1;
  final TextStyle tile2;
  final TextStyle tile7;
  // Note
  final TextStyle note1;
  final TextStyle note2;
  final TextStyle note3;
  final TextStyle note4;
  final TextStyle note5;
  // Label
  final TextStyle label1;
  final TextStyle label2;
  final TextStyle label3;
  final TextStyle label4;
  final TextStyle label5;
  final TextStyle label6;
  final TextStyle label7;
  final TextStyle label8;
  final TextStyle label9;
  final TextStyle label10;
  final TextStyle label1Light;

  static const standard = AppTypographyExtension(
    d1: AppTypographyPrimitives.d1,
    d2: AppTypographyPrimitives.d2,
    d3: AppTypographyPrimitives.d3,
    h1: AppTypographyPrimitives.h1,
    h2: AppTypographyPrimitives.h2,
    h3: AppTypographyPrimitives.h3,
    h4: AppTypographyPrimitives.h4,
    h5: AppTypographyPrimitives.h5,
    body1: AppTypographyPrimitives.body1,
    body2: AppTypographyPrimitives.body2,
    tile1: AppTypographyPrimitives.tile1,
    tile2: AppTypographyPrimitives.tile2,
    tile7: AppTypographyPrimitives.tile7,
    note1: AppTypographyPrimitives.note1,
    note2: AppTypographyPrimitives.note2,
    note3: AppTypographyPrimitives.note3,
    note4: AppTypographyPrimitives.note4,
    note5: AppTypographyPrimitives.note5,
    label1: AppTypographyPrimitives.label1,
    label2: AppTypographyPrimitives.label2,
    label3: AppTypographyPrimitives.label3,
    label4: AppTypographyPrimitives.label4,
    label5: AppTypographyPrimitives.label5,
    label6: AppTypographyPrimitives.label6,
    label7: AppTypographyPrimitives.label7,
    label8: AppTypographyPrimitives.label8,
    label9: AppTypographyPrimitives.label9,
    label10: AppTypographyPrimitives.label10,
    label1Light: AppTypographyPrimitives.label1Light,
  );
}
