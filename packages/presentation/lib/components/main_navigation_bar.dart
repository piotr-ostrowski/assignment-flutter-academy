import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/theme/app_colors.dart';
import 'package:presentation/theme/app_sizing.dart';
import 'package:presentation/theme/app_typography.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({super.key, this.selectedIndex = 0, this.onDestinationSelected});

  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  static const _items = [
    (icon: 'packages/presentation/assets/house_default.svg', label: 'Home'),
    (icon: 'packages/presentation/assets/notifications_default.svg', label: 'Notifications'),
    (icon: 'packages/presentation/assets/analysis_default.svg', label: 'Analysis'),
    (icon: 'packages/presentation/assets/vistore_default.svg', label: 'Discover'),
    (icon: 'packages/presentation/assets/settings_default.svg', label: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return SafeArea(
      top: false,
      left: false,
      right: false,
      bottom: Platform.isAndroid,
      child: Container(
        decoration: BoxDecoration(
          color: colors.basic.surface.default_,
          boxShadow: [
            BoxShadow(
              color: colors.basic.content.default_.withValues(alpha: 0.08),
              offset: const Offset(0, -4),
              blurRadius: 12,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: AppSizing.spacing4, horizontal: AppSizing.spacing4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final isSelected = index == selectedIndex;
            final color = isSelected ? colors.action.content.default_ : colors.basic.content.secondary;

            return Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onDestinationSelected?.call(index),
                  customBorder: const CircleBorder(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        item.icon,
                        width: AppSizing.iconLarge,
                        height: AppSizing.iconLarge,
                        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                      ),
                      const SizedBox(height: AppSizing.spacing4),
                      Text(
                        item.label,
                        style: typography.note4.copyWith(color: color),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
