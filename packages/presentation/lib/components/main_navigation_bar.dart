import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    super.key,
    this.selectedIndex = 0,
    this.onDestinationSelected,
  });

  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  static const _items = [
    (
      icon: 'packages/presentation/assets/house_default.svg',
      label: 'Home',
    ),
    (
      icon: 'packages/presentation/assets/notifications_default.svg',
      label: 'Notifications',
    ),
    (
      icon: 'packages/presentation/assets/analysis_default.svg',
      label: 'Analysis',
    ),
    (
      icon: 'packages/presentation/assets/vistore_default.svg',
      label: 'ViCare+',
    ),
    (
      icon: 'packages/presentation/assets/settings_default.svg',
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      top: false,
      left: false,
      right: false,
      bottom: Platform.isAndroid,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border(
            top: BorderSide(
              color: colorScheme.outlineVariant,
              width: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final isSelected = index == selectedIndex;
            final color = isSelected
                ? colorScheme.primary
                : colorScheme.onSurfaceVariant;

            return Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onDestinationSelected?.call(index),
                  customBorder: const CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          item.icon,
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.label,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: color,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
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
