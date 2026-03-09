import 'package:flutter/material.dart';
import 'package:presentation/theme/app_colors.dart';
import 'package:presentation/theme/app_sizing.dart';
import 'package:presentation/theme/app_typography.dart';

class SectionHeaderItem extends StatelessWidget {
  const SectionHeaderItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSizing.spacing16,
        AppSizing.spacing16,
        0,
        AppSizing.spacing8,
      ),
      child: Text(
        title,
        style: typography.note2.copyWith(color: colors.basic.content.secondary),
      ),
    );
  }
}
