import 'package:auto_route/auto_route.dart';
import 'package:core/models/photovoltaic/photovoltaic_model.dart';
import 'package:core/models/photovoltaic/photovoltaic_status.dart';
import 'package:core/models/period_stats/current_stats_by_period.dart';
import 'package:core/repositories/photovoltaic_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/router/app_router.gr.dart';
import 'package:presentation/screens/photovoltaic/bloc/photovoltaic_cubit.dart';
import 'package:presentation/theme/app_colors.dart';
import 'package:presentation/theme/app_sizing.dart';
import 'package:presentation/theme/app_typography.dart';

@RoutePage()
class PhotovoltaicScreen extends StatelessWidget {
  const PhotovoltaicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PhotovoltaicCubit(
        photovoltaicRepository: GetIt.I<PhotovoltaicRepository>(),
      )..loadData(),
      child: const _PhotovoltaicScreenContent(),
    );
  }
}

class _PhotovoltaicScreenContent extends StatelessWidget {
  const _PhotovoltaicScreenContent();

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
        title: Text('Photovoltaic', style: typography.h3),
        titleSpacing: 0,
      ),
      body: BlocBuilder<PhotovoltaicCubit, PhotovoltaicDetailState>(
        builder: (context, state) {
          if (state.status == PhotovoltaicDetailStatus.loading ||
              state.status == PhotovoltaicDetailStatus.initial) {
            return Center(
              child: CircularProgressIndicator(color: colors.special.solar),
            );
          }
          if (state.status == PhotovoltaicDetailStatus.failure || state.data == null) {
            return Center(
              child: Text('Failed to load data', style: typography.body2),
            );
          }
          return _PhotovoltaicContent(
            data: state.data!,
            liveStatus: state.liveStatus ?? state.data!.status,
          );
        },
      ),
    );
  }
}

class _PhotovoltaicContent extends StatelessWidget {
  const _PhotovoltaicContent({required this.data, required this.liveStatus});

  final PhotovoltaicModel data;
  final PhotovoltaicStatus? liveStatus;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizing.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ProductionHeader(data: data, liveStatus: liveStatus),
          const SizedBox(height: AppSizing.spacing16),
          if (data.productionCumulated != null) ...[
            _StatsCard(stats: data.productionCumulated!),
            const SizedBox(height: AppSizing.spacing16),
          ],
          _InstallationCard(data: data),
          const SizedBox(height: AppSizing.spacing16),
          FilledButton.icon(
            onPressed: () => context.router.push(const PhotovoltaicModeRoute()),
            icon: const Icon(Icons.tune),
            label: const Text('PV Mode'),
          ),
          const SizedBox(height: AppSizing.spacing16),
        ],
      ),
    );
  }
}

// ─── Production header ────────────────────────────────────────────────────────

class _ProductionHeader extends StatelessWidget {
  const _ProductionHeader({required this.data, required this.liveStatus});

  final PhotovoltaicModel data;
  final PhotovoltaicStatus? liveStatus;

  IconData _statusIcon(PhotovoltaicStatus? status) => switch (status) {
    PhotovoltaicStatus.production => Icons.bolt,
    PhotovoltaicStatus.ready => Icons.wb_sunny_outlined,
    PhotovoltaicStatus.off => Icons.power_settings_new,
    PhotovoltaicStatus.error => Icons.error_outline,
    PhotovoltaicStatus.nothing || null => Icons.circle_outlined,
  };

  String _statusLabel(PhotovoltaicStatus? status) => switch (status) {
    PhotovoltaicStatus.production => 'Producing',
    PhotovoltaicStatus.ready => 'Ready',
    PhotovoltaicStatus.off => 'Off',
    PhotovoltaicStatus.error => 'Error',
    PhotovoltaicStatus.nothing || null => 'No signal',
  };

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;
    final production = data.currentProduction;
    final unit = data.currentProductionUnit ?? '';
    final valueText = production != null ? production.toStringAsFixed(2) : '--';

    return Container(
      padding: const EdgeInsets.all(AppSizing.spacing24),
      decoration: BoxDecoration(
        color: colors.basic.surface.default_,
        borderRadius: BorderRadius.circular(AppSizing.radiusMedium),
        boxShadow: const [
          BoxShadow(color: Color(0x10000000), offset: Offset(0, 4), blurRadius: 4),
        ],
      ),
      child: Column(
        children: [
          Icon(
            _statusIcon(liveStatus),
            size: AppSizing.iconLarge,
            color: colors.special.solar,
          ),
          const SizedBox(height: AppSizing.spacing8),
          Text(
            valueText,
            style: typography.d3.copyWith(color: colors.basic.content.default_),
          ),
          if (unit.isNotEmpty)
            Text(
              unit,
              style: typography.h4.copyWith(color: colors.basic.content.secondary),
            ),
          const SizedBox(height: AppSizing.spacing8),
          Text(
            _statusLabel(liveStatus),
            style: typography.note1.copyWith(color: colors.basic.content.secondary),
          ),
        ],
      ),
    );
  }
}

// ─── Cumulated stats card ─────────────────────────────────────────────────────

class _StatsCard extends StatelessWidget {
  const _StatsCard({required this.stats});

  final CurrentStatsByPeriod stats;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;
    final unit = stats.unit;

    final rows = [
      ('Today', stats.currentDay),
      ('This week', stats.currentWeek),
      ('This month', stats.currentMonth),
      ('This year', stats.currentYear),
      ('Lifetime', stats.lifecycle),
    ];

    return Container(
      decoration: BoxDecoration(
        color: colors.basic.surface.default_,
        borderRadius: BorderRadius.circular(AppSizing.radiusMedium),
        boxShadow: const [
          BoxShadow(color: Color(0x10000000), offset: Offset(0, 4), blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSizing.spacing16,
              AppSizing.spacing16,
              AppSizing.spacing16,
              AppSizing.spacing8,
            ),
            child: Text(
              'Production',
              style: typography.h5.copyWith(color: colors.basic.content.default_),
            ),
          ),
          const Divider(height: 1),
          ...rows.map(
            (row) => _StatsRow(
              label: row.$1,
              value: row.$2.toStringAsFixed(2),
              unit: unit,
              typography: typography,
              colors: colors,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({
    required this.label,
    required this.value,
    required this.unit,
    required this.typography,
    required this.colors,
  });

  final String label;
  final String value;
  final String unit;
  final AppTypographyExtension typography;
  final AppColorsExtension colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizing.spacing16,
        vertical: AppSizing.spacing12,
      ),
      child: Row(
        children: [
          Text(label, style: typography.body2.copyWith(color: colors.basic.content.secondary)),
          const Spacer(),
          Text(
            '$value $unit',
            style: typography.body2.copyWith(color: colors.basic.content.default_),
          ),
        ],
      ),
    );
  }
}

// ─── Installation info card ───────────────────────────────────────────────────

class _InstallationCard extends StatelessWidget {
  const _InstallationCard({required this.data});

  final PhotovoltaicModel data;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    final peakPower = data.installedPeakPower;
    final consolidatedPeak = data.hasConsolidatedData ? data.installedPeakPowerConsolidatedTotal : null;

    return Container(
      decoration: BoxDecoration(
        color: colors.basic.surface.default_,
        borderRadius: BorderRadius.circular(AppSizing.radiusMedium),
        boxShadow: const [
          BoxShadow(color: Color(0x10000000), offset: Offset(0, 4), blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSizing.spacing16,
              AppSizing.spacing16,
              AppSizing.spacing16,
              AppSizing.spacing8,
            ),
            child: Text(
              'Installation',
              style: typography.h5.copyWith(color: colors.basic.content.default_),
            ),
          ),
          const Divider(height: 1),
          _StatsRow(
            label: 'Peak power',
            value: peakPower != null ? peakPower.toStringAsFixed(2) : '--',
            unit: peakPower != null ? 'kWp' : '',
            typography: typography,
            colors: colors,
          ),
          if (consolidatedPeak != null)
            _StatsRow(
              label: 'Consolidated peak',
              value: consolidatedPeak.toStringAsFixed(2),
              unit: 'kWp',
              typography: typography,
              colors: colors,
            ),
        ],
      ),
    );
  }
}
