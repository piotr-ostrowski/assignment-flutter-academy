import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:presentation/theme/app_colors.dart';
import 'package:presentation/theme/app_sizing.dart';
import 'package:presentation/theme/app_typography.dart';

@RoutePage()
class PhotovoltaicModeScreen extends StatelessWidget {
  const PhotovoltaicModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Scaffold(
      backgroundColor: colors.basic.background.default_,
      appBar: AppBar(
        backgroundColor: colors.basic.background.default_,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.basic.content.default_),
          onPressed: () => context.router.maybePop(),
        ),
        title: Text('PV Mode', style: typography.h3),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizing.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ModeCard(
              icon: Icons.eco,
              title: 'Eco Mode',
              description: 'Prioritise self-consumption and minimise grid export.',
              color: colors.special.solar,
              typography: typography,
              colors: colors,
            ),
            const SizedBox(height: AppSizing.spacing16),
            _ModeCard(
              icon: Icons.bolt,
              title: 'Power Mode',
              description: 'Maximise energy production and feed excess to the grid.',
              color: colors.special.electricity,
              typography: typography,
              colors: colors,
            ),
            const SizedBox(height: AppSizing.spacing16),
            _ModeCard(
              icon: Icons.nightlight_round,
              title: 'Night Mode',
              description: 'Reduce output during low-demand night hours.',
              color: colors.special.blue,
              typography: typography,
              colors: colors,
            ),
          ],
        ),
      ),
    );
  }
}

class _ModeCard extends StatelessWidget {
  const _ModeCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.typography,
    required this.colors,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final AppTypographyExtension typography;
  final AppColorsExtension colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizing.spacing16),
      decoration: BoxDecoration(
        color: colors.basic.surface.default_,
        borderRadius: BorderRadius.circular(AppSizing.radiusMedium),
        boxShadow: const [
          BoxShadow(color: Color(0x10000000), offset: Offset(0, 4), blurRadius: 4),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: AppSizing.iconLarge,
            height: AppSizing.iconLarge,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppSizing.radiusSmall),
            ),
            child: Icon(icon, color: color, size: AppSizing.iconMedium),
          ),
          const SizedBox(width: AppSizing.spacing16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: typography.h5.copyWith(color: colors.basic.content.default_)),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: typography.note2.copyWith(color: colors.basic.content.secondary),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: colors.basic.content.disabled),
        ],
      ),
    );
  }
}
