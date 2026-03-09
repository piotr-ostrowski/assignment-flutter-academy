import 'package:flutter/material.dart';

class HomeTileData {
  const HomeTileData({
    this.topIcons = const [],
    this.topRightLabel,
    this.centerText,
    required this.bottomLabel,
  });

  final List<IconData> topIcons;
  final String? topRightLabel;
  final String? centerText;
  final String bottomLabel;
}
