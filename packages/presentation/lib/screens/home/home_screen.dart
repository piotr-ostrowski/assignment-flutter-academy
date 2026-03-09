import 'package:auto_route/auto_route.dart';
import 'package:core/models/photovoltaic/photovoltaic_status.dart';
import 'package:core/repositories/photovoltaic_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/components/tile_card.dart';
import 'package:presentation/screens/home/bloc/home_cubit.dart';
import 'package:presentation/theme/app_colors.dart';
import 'package:presentation/theme/app_sizing.dart';
import 'package:presentation/theme/app_typography.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        photovoltaicRepository: GetIt.I<PhotovoltaicRepository>(),
      )..loadData(),
      child: const _HomeScreenContent(),
    );
  }
}

class _HomeScreenContent extends StatelessWidget {
  const _HomeScreenContent();

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
      BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final isLoading = state.status == HomeStatus.initial ||
              state.status == HomeStatus.loading;
          final data = state.photovoltaicData;

          final production = data?.currentProduction;
          final unit = data?.currentProductionUnit ?? '';
          final centerText = isLoading || production == null
              ? '--'
              : '${production.toStringAsFixed(2)} $unit';

          return TileCard(
            topIcons: [_photovoltaicStatusIcon(state.photovoltaicStatus, colors)],
            centerText: centerText,
            bottomLabel: 'Photovoltaic',
          );
        },
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

  Widget _photovoltaicStatusIcon(
    PhotovoltaicStatus? status,
    AppColorsExtension colors,
  ) {
    final icon = switch (status) {
      PhotovoltaicStatus.production => Icons.bolt,
      PhotovoltaicStatus.ready => Icons.wb_sunny_outlined,
      PhotovoltaicStatus.off => Icons.power_settings_new,
      PhotovoltaicStatus.error => Icons.error_outline,
      PhotovoltaicStatus.nothing || null => Icons.circle_outlined,
    };
    return Icon(icon, size: 24, color: colors.basic.content.default_);
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
