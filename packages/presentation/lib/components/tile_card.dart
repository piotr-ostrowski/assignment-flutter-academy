import 'package:flutter/material.dart';
import 'package:presentation/theme/app_colors.dart';
import 'package:presentation/theme/app_sizing.dart';
import 'package:presentation/theme/app_typography.dart';

class TileCard extends StatelessWidget {
  const TileCard({
    super.key,
    this.topIcons = const [],
    this.topRightLabel,
    this.centerIcon,
    this.centerText,
    required this.bottomLabel,
    this.onTap,
  }) : assert(centerIcon != null || centerText != null, 'Either centerIcon or centerText must be provided');

  /// Icons displayed in the top-left row. Each should be 24×24.
  final List<Widget> topIcons;

  /// Short label shown in the top-right corner (e.g. "⊙ 1").
  final String? topRightLabel;

  /// Optional 56×56 icon shown in the center (takes priority over centerText).
  final Widget? centerIcon;

  /// Value text shown in the center when no centerIcon is provided.
  final String? centerText;

  final String bottomLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;
    final labelColor = colors.basic.content.secondary;
    final centerColor = colors.basic.content.default_;

    return Container(
      decoration: BoxDecoration(
        color: colors.basic.surface.default_,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Top row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (topIcons.isNotEmpty)
                        Row(
                          spacing: 4,
                          children: topIcons
                              .map(
                                (icon) => SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: icon,
                                ),
                              )
                              .toList(),
                        ),
                      const Spacer(),
                      if (topRightLabel != null)
                        Text(
                          topRightLabel!,
                          style: typography.tile7.copyWith(
                            color: labelColor,
                          ),
                        ),
                    ],
                  ),
                  // Center
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizing.spacing12,
                      ),
                      child: Center(
                        child: centerIcon != null
                            ? SizedBox(width: 56, height: 56, child: centerIcon)
                            : FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  centerText!,
                                  style: typography.tile2.copyWith(color: centerColor),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                ),
                              ),
                      ),
                    ),
                  ),
                  // Bottom label
                  Text(
                    bottomLabel,
                    style: typography.tile7.copyWith(
                      color: labelColor,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
