import 'package:flutter/material.dart';
import 'package:presentation/theme/app_color_primitives.dart';
import 'package:presentation/theme/app_colors.dart';
import 'package:presentation/theme/app_sizing.dart';
import 'package:presentation/theme/app_typography.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.badgeCount,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final int? badgeCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return InkWell(
      onTap: onTap,
      child: ColoredBox(
        color: colors.basic.surface.default_,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizing.spacing16,
            vertical: AppSizing.spacing20,
          ),
          child: Row(
            children: [
              // Icon
              Icon(
                icon,
                size: AppSizing.iconMedium,
                color: colors.basic.content.default_,
              ),

              const SizedBox(width: AppSizing.spacing16),

              // Title, optional subtitle
              _MenuItemTitleSubtitle(
                title: title,
                typography: typography,
                colors: colors,
                subtitle: subtitle,
              ),

              // Optional badge
              if (badgeCount != null) ...[
                const SizedBox(width: AppSizing.spacing8),
                _MenuItemBadge(count: badgeCount!),
              ],

              const SizedBox(width: AppSizing.spacing8),

              // Chevron icon
              Icon(
                Icons.chevron_right,
                size: AppSizing.iconMedium,
                color: colors.basic.content.default_,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuItemTitleSubtitle extends StatelessWidget {
  const _MenuItemTitleSubtitle({
    required this.title,
    required this.typography,
    required this.colors,
    required this.subtitle,
  });

  final String title;
  final AppTypographyExtension typography;
  final AppColorsExtension colors;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: typography.label8.copyWith(
              color: colors.basic.content.default_,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: AppSizing.spacing4),
            Text(
              subtitle!,
              style: typography.label9.copyWith(
                color: colors.basic.content.secondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _MenuItemBadge extends StatelessWidget {
  const _MenuItemBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizing.iconMedium,
      height: AppSizing.iconMedium,
      decoration: const BoxDecoration(
        color: AppColorPrimitives.red100,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        '$count',
        style: context.appTypography.label9.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
