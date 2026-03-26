import 'package:auto_route/auto_route.dart';
import 'package:core/repositories/photovoltaic_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/components/tile_card.dart';
import 'package:presentation/router/app_router.gr.dart';
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

    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (prev, curr) => curr.pendingNavigation != null && curr.pendingNavigation != prev.pendingNavigation,
      listener: (context, state) {
        switch (state.pendingNavigation!) {
          case HomeDestination.photovoltaic:
            context.router.push(const PhotovoltaicRoute());
        }
        context.read<HomeCubit>().clearNavigation();
      },
      child: Scaffold(
        backgroundColor: colors.basic.background.default_,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // Header with location and status
              HomeScreenHeader(typography: typography, colors: colors),
              // Grid of tiles
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) => SliverPadding(
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
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final tile = state.tiles[index];
                        final iconColor = context.appColors.basic.content.default_;
                        return TileCard(
                          topIcons: tile.topIcons
                              .map(
                                (icon) => Icon(
                                  icon,
                                  size: 24,
                                  color: iconColor,
                                ),
                              )
                              .toList(),
                          topRightLabel: tile.topRightLabel,
                          centerText: tile.centerText,
                          bottomLabel: tile.bottomLabel,
                          onTap: tile.onTap,
                        );
                      },
                      childCount: state.tiles.length,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
