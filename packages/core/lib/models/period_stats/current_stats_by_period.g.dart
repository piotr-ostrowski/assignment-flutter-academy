// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_stats_by_period.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurrentStatsByPeriod _$CurrentStatsByPeriodFromJson(
  Map<String, dynamic> json,
) => _CurrentStatsByPeriod(
  currentDay: (json['currentDay'] as num).toDouble(),
  currentWeek: (json['currentWeek'] as num).toDouble(),
  currentMonth: (json['currentMonth'] as num).toDouble(),
  currentYear: (json['currentYear'] as num).toDouble(),
  lifecycle: (json['lifecycle'] as num).toDouble(),
  unit: json['unit'] as String,
);

Map<String, dynamic> _$CurrentStatsByPeriodToJson(
  _CurrentStatsByPeriod instance,
) => <String, dynamic>{
  'currentDay': instance.currentDay,
  'currentWeek': instance.currentWeek,
  'currentMonth': instance.currentMonth,
  'currentYear': instance.currentYear,
  'lifecycle': instance.lifecycle,
  'unit': instance.unit,
};
