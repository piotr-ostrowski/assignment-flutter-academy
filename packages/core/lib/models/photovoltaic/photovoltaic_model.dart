import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core/models/period_stats/current_stats_by_period.dart';
import 'package:core/models/photovoltaic/photovoltaic_exception_state.dart';
import 'package:core/models/photovoltaic/photovoltaic_status.dart';

part 'photovoltaic_model.freezed.dart';
part 'photovoltaic_model.g.dart';

@freezed
abstract class PhotovoltaicModel with _$PhotovoltaicModel {
  const factory PhotovoltaicModel({
    PhotovoltaicStatus? status,
    required bool isOverviewEnabled,
    required List<PhotovoltaicExceptionState> exceptionStates,
    double? currentProduction,
    String? currentProductionUnit,
    CurrentStatsByPeriod? productionCumulated,
    double? installedPeakPower,
    double? installedPeakPowerConsolidatedTotal,
    required bool hasConsolidatedData,
  }) = _PhotovoltaicModel;

  factory PhotovoltaicModel.fromJson(Map<String, dynamic> json) =>
      _$PhotovoltaicModelFromJson(json);
}
