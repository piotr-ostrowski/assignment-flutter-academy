import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_stats_by_period.freezed.dart';
part 'current_stats_by_period.g.dart';

@freezed
abstract class CurrentStatsByPeriod with _$CurrentStatsByPeriod {
  const factory CurrentStatsByPeriod({
    required double currentDay,
    required double currentWeek,
    required double currentMonth,
    required double currentYear,
    required double lifecycle,
    required String unit,
  }) = _CurrentStatsByPeriod;

  factory CurrentStatsByPeriod.fromJson(Map<String, dynamic> json) =>
      _$CurrentStatsByPeriodFromJson(json);
}
