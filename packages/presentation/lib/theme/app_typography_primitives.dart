import 'package:flutter/material.dart';

abstract final class AppTypographyPrimitives {
  static const String _fontFamily = 'ViessmannBrand';

  static const _pnum = [FontFeature.proportionalFigures()];

  // ─── Display ───────────────────────────────────────────────────────────────

  static const d1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 130,
    fontWeight: FontWeight.w400,
    fontFeatures: _pnum,
  );
  static const d2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 100,
    fontWeight: FontWeight.w400,
    fontFeatures: _pnum,
  );
  static const d3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 56,
    fontWeight: FontWeight.w400,
    fontFeatures: _pnum,
  );

  // ─── Heading ───────────────────────────────────────────────────────────────

  static const h1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w500,
    fontFeatures: _pnum,
  );
  static const h2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFeatures: _pnum,
  );
  static const h3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const h4 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const h5 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // ─── Body ──────────────────────────────────────────────────────────────────

  static const body1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 24 / 18,
  );
  static const body2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    fontFeatures: _pnum,
  );

  // ─── Tile ──────────────────────────────────────────────────────────────────

  static const tile1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 40,
    fontWeight: FontWeight.w500,
    fontFeatures: _pnum,
  );
  static const tile2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 40,
    fontWeight: FontWeight.w400,
    fontFeatures: _pnum,
  );
  static const tile7 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFeatures: _pnum,
  );

  // ─── Note ──────────────────────────────────────────────────────────────────

  static const note1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFeatures: _pnum,
  );
  static const note2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFeatures: _pnum,
  );
  static const note3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFeatures: _pnum,
  );
  static const note4 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFeatures: _pnum,
  );
  static const note5 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFeatures: _pnum,
  );

  // ─── Label ─────────────────────────────────────────────────────────────────

  static const label1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w400,
    fontFeatures: _pnum,
  );
  static const label2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w400,
    fontFeatures: _pnum,
  );
  static const label3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w400,
    fontFeatures: _pnum,
  );
  static const label4 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w400,
    fontFeatures: _pnum,
  );
  static const label5 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFeatures: _pnum,
  );
  static const label6 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static const label7 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFeatures: _pnum,
  );
  static const label8 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFeatures: _pnum,
  );
  static const label9 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFeatures: _pnum,
  );
  static const label10 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    fontFeatures: _pnum,
  );

  // label1 with light weight (w300) — used for labelXXLargeLight
  static const label1Light = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w300,
    fontFeatures: _pnum,
  );

  // ─── Material TextTheme mapping ────────────────────────────────────────────

  static TextTheme get appTextTheme => const TextTheme(
    displayLarge: d1,
    displayMedium: d2,
    displaySmall: d3,
    headlineLarge: h1,
    headlineMedium: h2,
    headlineSmall: h3,
    titleLarge: h4,
    titleMedium: h5,
    titleSmall: label7,
    bodyLarge: body1,
    bodyMedium: body2,
    bodySmall: note3,
    labelLarge: note1,
    labelMedium: note2,
    labelSmall: note3,
  );
}
