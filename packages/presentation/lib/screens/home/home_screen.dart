import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/tile_card.dart';
import 'package:presentation/theme/app_colors.dart';
import 'package:presentation/theme/app_sizing.dart';
import 'package:presentation/theme/app_typography.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Scaffold(
      backgroundColor: colors.basic.background.default_,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeScreenHeader(typography: typography, colors: colors),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                AppSizing.spacing16,
                AppSizing.spacing8,
                AppSizing.spacing16,
                AppSizing.spacing16,
              ),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppSizing.spacing16,
                  mainAxisSpacing: AppSizing.spacing16,
                  childAspectRatio: 156 / 168,
                ),
                delegate: SliverChildListDelegate(_buildCards(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCards(BuildContext context) {
    final colors = context.appColors;
    final iconColor = colors.basic.content.default_;

    return [
      TileCard(
        topIcons: [Icon(Icons.power, size: 24, color: iconColor)],
        topRightLabel: '⊙ 1',
        centerText: '55°',
        bottomLabel: 'Heat pump\ndiagnostic',
      ),
      TileCard(topRightLabel: '⊙ 2', centerText: '--', bottomLabel: 'Heat pump\ndiagnostic'),
      TileCard(
        topIcons: [Icon(Icons.power, size: 24, color: iconColor)],
        topRightLabel: '⊙ 3',
        centerText: '55°',
        bottomLabel: 'Heat pump\ndiagnostic',
      ),
      TileCard(centerText: '--', bottomLabel: 'Boiler status'),
      TileCard(centerText: '30°', bottomLabel: 'Boiler status'),
      TileCard(
        topIcons: [Icon(Icons.flag_outlined, size: 24, color: iconColor)],
        centerText: '55°',
        bottomLabel: 'Boiler status',
      ),
      TileCard(
        topIcons: [
          Icon(Icons.power, size: 24, color: iconColor),
          Icon(Icons.air, size: 24, color: iconColor),
        ],
        topRightLabel: '⊙ 4',
        centerText: '55°',
        bottomLabel: 'Heat pump\ndiagnostic',
      ),
      TileCard(
        topIcons: [
          Icon(Icons.play_circle_outline, size: 24, color: iconColor),
          Icon(Icons.power, size: 24, color: iconColor),
          Icon(Icons.air, size: 24, color: iconColor),
        ],
        topRightLabel: '⊙ 5',
        centerText: '55°',
        bottomLabel: 'Heat pump\ndiagnostic',
      ),
    ];
  }
}

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({
    super.key,
    required this.typography,
    required this.colors,
  });

  final AppTypographyExtension typography;
  final AppColorsExtension colors;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSizing.spacing16,
          AppSizing.spacing16,
          AppSizing.spacing16,
          AppSizing.spacing8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Allendorf', style: typography.h1),
            const SizedBox(height: AppSizing.spacing4),
            Row(
              children: [
                Icon(Icons.check_circle_outline, size: 16, color: colors.basic.content.secondary),
                const SizedBox(width: AppSizing.spacing4),
                Text(
                  'Your installation is doing well',
                  style: typography.body2.copyWith(color: colors.basic.content.secondary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
