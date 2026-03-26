import 'package:flutter/material.dart';

class HomeTileData {
  const HomeTileData({
    this.topIcons = const [],
    this.topRightLabel,
    this.centerText,
    required this.bottomLabel,
    this.onTap,
  });

  final List<IconData> topIcons;
  final String? topRightLabel;
  final String? centerText;
  final String bottomLabel;
  final VoidCallback? onTap;
}
