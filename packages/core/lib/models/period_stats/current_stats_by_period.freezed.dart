// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_stats_by_period.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurrentStatsByPeriod {

 double get currentDay; double get currentWeek; double get currentMonth; double get currentYear; double get lifecycle; String get unit;
/// Create a copy of CurrentStatsByPeriod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentStatsByPeriodCopyWith<CurrentStatsByPeriod> get copyWith => _$CurrentStatsByPeriodCopyWithImpl<CurrentStatsByPeriod>(this as CurrentStatsByPeriod, _$identity);

  /// Serializes this CurrentStatsByPeriod to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentStatsByPeriod&&(identical(other.currentDay, currentDay) || other.currentDay == currentDay)&&(identical(other.currentWeek, currentWeek) || other.currentWeek == currentWeek)&&(identical(other.currentMonth, currentMonth) || other.currentMonth == currentMonth)&&(identical(other.currentYear, currentYear) || other.currentYear == currentYear)&&(identical(other.lifecycle, lifecycle) || other.lifecycle == lifecycle)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentDay,currentWeek,currentMonth,currentYear,lifecycle,unit);

@override
String toString() {
  return 'CurrentStatsByPeriod(currentDay: $currentDay, currentWeek: $currentWeek, currentMonth: $currentMonth, currentYear: $currentYear, lifecycle: $lifecycle, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $CurrentStatsByPeriodCopyWith<$Res>  {
  factory $CurrentStatsByPeriodCopyWith(CurrentStatsByPeriod value, $Res Function(CurrentStatsByPeriod) _then) = _$CurrentStatsByPeriodCopyWithImpl;
@useResult
$Res call({
 double currentDay, double currentWeek, double currentMonth, double currentYear, double lifecycle, String unit
});




}
/// @nodoc
class _$CurrentStatsByPeriodCopyWithImpl<$Res>
    implements $CurrentStatsByPeriodCopyWith<$Res> {
  _$CurrentStatsByPeriodCopyWithImpl(this._self, this._then);

  final CurrentStatsByPeriod _self;
  final $Res Function(CurrentStatsByPeriod) _then;

/// Create a copy of CurrentStatsByPeriod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentDay = null,Object? currentWeek = null,Object? currentMonth = null,Object? currentYear = null,Object? lifecycle = null,Object? unit = null,}) {
  return _then(_self.copyWith(
currentDay: null == currentDay ? _self.currentDay : currentDay // ignore: cast_nullable_to_non_nullable
as double,currentWeek: null == currentWeek ? _self.currentWeek : currentWeek // ignore: cast_nullable_to_non_nullable
as double,currentMonth: null == currentMonth ? _self.currentMonth : currentMonth // ignore: cast_nullable_to_non_nullable
as double,currentYear: null == currentYear ? _self.currentYear : currentYear // ignore: cast_nullable_to_non_nullable
as double,lifecycle: null == lifecycle ? _self.lifecycle : lifecycle // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentStatsByPeriod].
extension CurrentStatsByPeriodPatterns on CurrentStatsByPeriod {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentStatsByPeriod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentStatsByPeriod() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentStatsByPeriod value)  $default,){
final _that = this;
switch (_that) {
case _CurrentStatsByPeriod():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentStatsByPeriod value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentStatsByPeriod() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double currentDay,  double currentWeek,  double currentMonth,  double currentYear,  double lifecycle,  String unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentStatsByPeriod() when $default != null:
return $default(_that.currentDay,_that.currentWeek,_that.currentMonth,_that.currentYear,_that.lifecycle,_that.unit);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double currentDay,  double currentWeek,  double currentMonth,  double currentYear,  double lifecycle,  String unit)  $default,) {final _that = this;
switch (_that) {
case _CurrentStatsByPeriod():
return $default(_that.currentDay,_that.currentWeek,_that.currentMonth,_that.currentYear,_that.lifecycle,_that.unit);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double currentDay,  double currentWeek,  double currentMonth,  double currentYear,  double lifecycle,  String unit)?  $default,) {final _that = this;
switch (_that) {
case _CurrentStatsByPeriod() when $default != null:
return $default(_that.currentDay,_that.currentWeek,_that.currentMonth,_that.currentYear,_that.lifecycle,_that.unit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentStatsByPeriod implements CurrentStatsByPeriod {
  const _CurrentStatsByPeriod({required this.currentDay, required this.currentWeek, required this.currentMonth, required this.currentYear, required this.lifecycle, required this.unit});
  factory _CurrentStatsByPeriod.fromJson(Map<String, dynamic> json) => _$CurrentStatsByPeriodFromJson(json);

@override final  double currentDay;
@override final  double currentWeek;
@override final  double currentMonth;
@override final  double currentYear;
@override final  double lifecycle;
@override final  String unit;

/// Create a copy of CurrentStatsByPeriod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentStatsByPeriodCopyWith<_CurrentStatsByPeriod> get copyWith => __$CurrentStatsByPeriodCopyWithImpl<_CurrentStatsByPeriod>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentStatsByPeriodToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentStatsByPeriod&&(identical(other.currentDay, currentDay) || other.currentDay == currentDay)&&(identical(other.currentWeek, currentWeek) || other.currentWeek == currentWeek)&&(identical(other.currentMonth, currentMonth) || other.currentMonth == currentMonth)&&(identical(other.currentYear, currentYear) || other.currentYear == currentYear)&&(identical(other.lifecycle, lifecycle) || other.lifecycle == lifecycle)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentDay,currentWeek,currentMonth,currentYear,lifecycle,unit);

@override
String toString() {
  return 'CurrentStatsByPeriod(currentDay: $currentDay, currentWeek: $currentWeek, currentMonth: $currentMonth, currentYear: $currentYear, lifecycle: $lifecycle, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$CurrentStatsByPeriodCopyWith<$Res> implements $CurrentStatsByPeriodCopyWith<$Res> {
  factory _$CurrentStatsByPeriodCopyWith(_CurrentStatsByPeriod value, $Res Function(_CurrentStatsByPeriod) _then) = __$CurrentStatsByPeriodCopyWithImpl;
@override @useResult
$Res call({
 double currentDay, double currentWeek, double currentMonth, double currentYear, double lifecycle, String unit
});




}
/// @nodoc
class __$CurrentStatsByPeriodCopyWithImpl<$Res>
    implements _$CurrentStatsByPeriodCopyWith<$Res> {
  __$CurrentStatsByPeriodCopyWithImpl(this._self, this._then);

  final _CurrentStatsByPeriod _self;
  final $Res Function(_CurrentStatsByPeriod) _then;

/// Create a copy of CurrentStatsByPeriod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentDay = null,Object? currentWeek = null,Object? currentMonth = null,Object? currentYear = null,Object? lifecycle = null,Object? unit = null,}) {
  return _then(_CurrentStatsByPeriod(
currentDay: null == currentDay ? _self.currentDay : currentDay // ignore: cast_nullable_to_non_nullable
as double,currentWeek: null == currentWeek ? _self.currentWeek : currentWeek // ignore: cast_nullable_to_non_nullable
as double,currentMonth: null == currentMonth ? _self.currentMonth : currentMonth // ignore: cast_nullable_to_non_nullable
as double,currentYear: null == currentYear ? _self.currentYear : currentYear // ignore: cast_nullable_to_non_nullable
as double,lifecycle: null == lifecycle ? _self.lifecycle : lifecycle // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
