import 'dart:async';

import 'package:core/models/photovoltaic/photovoltaic_model.dart';
import 'package:core/models/photovoltaic/photovoltaic_status.dart';
import 'package:core/repositories/photovoltaic_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/screens/home/factory/home_mock_tiles.dart';
import 'package:presentation/screens/home/model/home_tile_data.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required PhotovoltaicRepository photovoltaicRepository})
    : _repository = photovoltaicRepository,
      super(HomeState.initial());

  final PhotovoltaicRepository _repository;
  StreamSubscription<PhotovoltaicStatus>? _statusSubscription;

  Future<void> loadData() async {
    emit(state.loading());
    try {
      final data = await _repository.getPhotovoltaicData();

      emit(state.success(tiles: [_buildPvTile(data, null), ...HomeMockTiles.tiles]));

      _statusSubscription?.cancel();
      _statusSubscription = _repository.getPhotovoltaicStatusStream().listen(
        (status) {
          emit(state.withFirstTile(_buildPvTile(data, status)));
        },
        onError: (Object error, StackTrace stackTrace) {
          // Simply not updating the state
          if (kDebugMode) {
            print('Error in photovoltaic status stream: $error');
          }
        },
      );
    } catch (e) {
      emit(state.failure());
    }
  }

  HomeTileData _buildPvTile(PhotovoltaicModel data, PhotovoltaicStatus? status) {
    final production = data.currentProduction;
    final unit = data.currentProductionUnit ?? '';
    return HomeTileData(
      topIcons: [_pvStatusIcon(status)],
      centerText: production != null ? '${production.toStringAsFixed(2)} $unit' : '--',
      bottomLabel: 'Photovoltaic',
    );
  }

  IconData _pvStatusIcon(PhotovoltaicStatus? status) => switch (status) {
    PhotovoltaicStatus.production => Icons.bolt,
    PhotovoltaicStatus.ready => Icons.wb_sunny_outlined,
    PhotovoltaicStatus.off => Icons.power_settings_new,
    PhotovoltaicStatus.error => Icons.error_outline,
    PhotovoltaicStatus.nothing || null => Icons.circle_outlined,
  };

  @override
  Future<void> close() {
    _statusSubscription?.cancel();
    return super.close();
  }
}
