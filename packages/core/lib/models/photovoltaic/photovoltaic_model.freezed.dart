// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photovoltaic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhotovoltaicModel {

 PhotovoltaicStatus? get status; bool get isOverviewEnabled; List<PhotovoltaicExceptionState> get exceptionStates; double? get currentProduction; String? get currentProductionUnit; CurrentStatsByPeriod? get productionCumulated; double? get installedPeakPower; double? get installedPeakPowerConsolidatedTotal; bool get hasConsolidatedData;
/// Create a copy of PhotovoltaicModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotovoltaicModelCopyWith<PhotovoltaicModel> get copyWith => _$PhotovoltaicModelCopyWithImpl<PhotovoltaicModel>(this as PhotovoltaicModel, _$identity);

  /// Serializes this PhotovoltaicModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotovoltaicModel&&(identical(other.status, status) || other.status == status)&&(identical(other.isOverviewEnabled, isOverviewEnabled) || other.isOverviewEnabled == isOverviewEnabled)&&const DeepCollectionEquality().equals(other.exceptionStates, exceptionStates)&&(identical(other.currentProduction, currentProduction) || other.currentProduction == currentProduction)&&(identical(other.currentProductionUnit, currentProductionUnit) || other.currentProductionUnit == currentProductionUnit)&&(identical(other.productionCumulated, productionCumulated) || other.productionCumulated == productionCumulated)&&(identical(other.installedPeakPower, installedPeakPower) || other.installedPeakPower == installedPeakPower)&&(identical(other.installedPeakPowerConsolidatedTotal, installedPeakPowerConsolidatedTotal) || other.installedPeakPowerConsolidatedTotal == installedPeakPowerConsolidatedTotal)&&(identical(other.hasConsolidatedData, hasConsolidatedData) || other.hasConsolidatedData == hasConsolidatedData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,isOverviewEnabled,const DeepCollectionEquality().hash(exceptionStates),currentProduction,currentProductionUnit,productionCumulated,installedPeakPower,installedPeakPowerConsolidatedTotal,hasConsolidatedData);

@override
String toString() {
  return 'PhotovoltaicModel(status: $status, isOverviewEnabled: $isOverviewEnabled, exceptionStates: $exceptionStates, currentProduction: $currentProduction, currentProductionUnit: $currentProductionUnit, productionCumulated: $productionCumulated, installedPeakPower: $installedPeakPower, installedPeakPowerConsolidatedTotal: $installedPeakPowerConsolidatedTotal, hasConsolidatedData: $hasConsolidatedData)';
}


}

/// @nodoc
abstract mixin class $PhotovoltaicModelCopyWith<$Res>  {
  factory $PhotovoltaicModelCopyWith(PhotovoltaicModel value, $Res Function(PhotovoltaicModel) _then) = _$PhotovoltaicModelCopyWithImpl;
@useResult
$Res call({
 PhotovoltaicStatus? status, bool isOverviewEnabled, List<PhotovoltaicExceptionState> exceptionStates, double? currentProduction, String? currentProductionUnit, CurrentStatsByPeriod? productionCumulated, double? installedPeakPower, double? installedPeakPowerConsolidatedTotal, bool hasConsolidatedData
});


$CurrentStatsByPeriodCopyWith<$Res>? get productionCumulated;

}
/// @nodoc
class _$PhotovoltaicModelCopyWithImpl<$Res>
    implements $PhotovoltaicModelCopyWith<$Res> {
  _$PhotovoltaicModelCopyWithImpl(this._self, this._then);

  final PhotovoltaicModel _self;
  final $Res Function(PhotovoltaicModel) _then;

/// Create a copy of PhotovoltaicModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? isOverviewEnabled = null,Object? exceptionStates = null,Object? currentProduction = freezed,Object? currentProductionUnit = freezed,Object? productionCumulated = freezed,Object? installedPeakPower = freezed,Object? installedPeakPowerConsolidatedTotal = freezed,Object? hasConsolidatedData = null,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PhotovoltaicStatus?,isOverviewEnabled: null == isOverviewEnabled ? _self.isOverviewEnabled : isOverviewEnabled // ignore: cast_nullable_to_non_nullable
as bool,exceptionStates: null == exceptionStates ? _self.exceptionStates : exceptionStates // ignore: cast_nullable_to_non_nullable
as List<PhotovoltaicExceptionState>,currentProduction: freezed == currentProduction ? _self.currentProduction : currentProduction // ignore: cast_nullable_to_non_nullable
as double?,currentProductionUnit: freezed == currentProductionUnit ? _self.currentProductionUnit : currentProductionUnit // ignore: cast_nullable_to_non_nullable
as String?,productionCumulated: freezed == productionCumulated ? _self.productionCumulated : productionCumulated // ignore: cast_nullable_to_non_nullable
as CurrentStatsByPeriod?,installedPeakPower: freezed == installedPeakPower ? _self.installedPeakPower : installedPeakPower // ignore: cast_nullable_to_non_nullable
as double?,installedPeakPowerConsolidatedTotal: freezed == installedPeakPowerConsolidatedTotal ? _self.installedPeakPowerConsolidatedTotal : installedPeakPowerConsolidatedTotal // ignore: cast_nullable_to_non_nullable
as double?,hasConsolidatedData: null == hasConsolidatedData ? _self.hasConsolidatedData : hasConsolidatedData // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PhotovoltaicModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentStatsByPeriodCopyWith<$Res>? get productionCumulated {
    if (_self.productionCumulated == null) {
    return null;
  }

  return $CurrentStatsByPeriodCopyWith<$Res>(_self.productionCumulated!, (value) {
    return _then(_self.copyWith(productionCumulated: value));
  });
}
}


/// Adds pattern-matching-related methods to [PhotovoltaicModel].
extension PhotovoltaicModelPatterns on PhotovoltaicModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotovoltaicModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotovoltaicModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotovoltaicModel value)  $default,){
final _that = this;
switch (_that) {
case _PhotovoltaicModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotovoltaicModel value)?  $default,){
final _that = this;
switch (_that) {
case _PhotovoltaicModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PhotovoltaicStatus? status,  bool isOverviewEnabled,  List<PhotovoltaicExceptionState> exceptionStates,  double? currentProduction,  String? currentProductionUnit,  CurrentStatsByPeriod? productionCumulated,  double? installedPeakPower,  double? installedPeakPowerConsolidatedTotal,  bool hasConsolidatedData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotovoltaicModel() when $default != null:
return $default(_that.status,_that.isOverviewEnabled,_that.exceptionStates,_that.currentProduction,_that.currentProductionUnit,_that.productionCumulated,_that.installedPeakPower,_that.installedPeakPowerConsolidatedTotal,_that.hasConsolidatedData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PhotovoltaicStatus? status,  bool isOverviewEnabled,  List<PhotovoltaicExceptionState> exceptionStates,  double? currentProduction,  String? currentProductionUnit,  CurrentStatsByPeriod? productionCumulated,  double? installedPeakPower,  double? installedPeakPowerConsolidatedTotal,  bool hasConsolidatedData)  $default,) {final _that = this;
switch (_that) {
case _PhotovoltaicModel():
return $default(_that.status,_that.isOverviewEnabled,_that.exceptionStates,_that.currentProduction,_that.currentProductionUnit,_that.productionCumulated,_that.installedPeakPower,_that.installedPeakPowerConsolidatedTotal,_that.hasConsolidatedData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PhotovoltaicStatus? status,  bool isOverviewEnabled,  List<PhotovoltaicExceptionState> exceptionStates,  double? currentProduction,  String? currentProductionUnit,  CurrentStatsByPeriod? productionCumulated,  double? installedPeakPower,  double? installedPeakPowerConsolidatedTotal,  bool hasConsolidatedData)?  $default,) {final _that = this;
switch (_that) {
case _PhotovoltaicModel() when $default != null:
return $default(_that.status,_that.isOverviewEnabled,_that.exceptionStates,_that.currentProduction,_that.currentProductionUnit,_that.productionCumulated,_that.installedPeakPower,_that.installedPeakPowerConsolidatedTotal,_that.hasConsolidatedData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhotovoltaicModel implements PhotovoltaicModel {
  const _PhotovoltaicModel({this.status, required this.isOverviewEnabled, required final  List<PhotovoltaicExceptionState> exceptionStates, this.currentProduction, this.currentProductionUnit, this.productionCumulated, this.installedPeakPower, this.installedPeakPowerConsolidatedTotal, required this.hasConsolidatedData}): _exceptionStates = exceptionStates;
  factory _PhotovoltaicModel.fromJson(Map<String, dynamic> json) => _$PhotovoltaicModelFromJson(json);

@override final  PhotovoltaicStatus? status;
@override final  bool isOverviewEnabled;
 final  List<PhotovoltaicExceptionState> _exceptionStates;
@override List<PhotovoltaicExceptionState> get exceptionStates {
  if (_exceptionStates is EqualUnmodifiableListView) return _exceptionStates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exceptionStates);
}

@override final  double? currentProduction;
@override final  String? currentProductionUnit;
@override final  CurrentStatsByPeriod? productionCumulated;
@override final  double? installedPeakPower;
@override final  double? installedPeakPowerConsolidatedTotal;
@override final  bool hasConsolidatedData;

/// Create a copy of PhotovoltaicModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotovoltaicModelCopyWith<_PhotovoltaicModel> get copyWith => __$PhotovoltaicModelCopyWithImpl<_PhotovoltaicModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotovoltaicModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotovoltaicModel&&(identical(other.status, status) || other.status == status)&&(identical(other.isOverviewEnabled, isOverviewEnabled) || other.isOverviewEnabled == isOverviewEnabled)&&const DeepCollectionEquality().equals(other._exceptionStates, _exceptionStates)&&(identical(other.currentProduction, currentProduction) || other.currentProduction == currentProduction)&&(identical(other.currentProductionUnit, currentProductionUnit) || other.currentProductionUnit == currentProductionUnit)&&(identical(other.productionCumulated, productionCumulated) || other.productionCumulated == productionCumulated)&&(identical(other.installedPeakPower, installedPeakPower) || other.installedPeakPower == installedPeakPower)&&(identical(other.installedPeakPowerConsolidatedTotal, installedPeakPowerConsolidatedTotal) || other.installedPeakPowerConsolidatedTotal == installedPeakPowerConsolidatedTotal)&&(identical(other.hasConsolidatedData, hasConsolidatedData) || other.hasConsolidatedData == hasConsolidatedData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,isOverviewEnabled,const DeepCollectionEquality().hash(_exceptionStates),currentProduction,currentProductionUnit,productionCumulated,installedPeakPower,installedPeakPowerConsolidatedTotal,hasConsolidatedData);

@override
String toString() {
  return 'PhotovoltaicModel(status: $status, isOverviewEnabled: $isOverviewEnabled, exceptionStates: $exceptionStates, currentProduction: $currentProduction, currentProductionUnit: $currentProductionUnit, productionCumulated: $productionCumulated, installedPeakPower: $installedPeakPower, installedPeakPowerConsolidatedTotal: $installedPeakPowerConsolidatedTotal, hasConsolidatedData: $hasConsolidatedData)';
}


}

/// @nodoc
abstract mixin class _$PhotovoltaicModelCopyWith<$Res> implements $PhotovoltaicModelCopyWith<$Res> {
  factory _$PhotovoltaicModelCopyWith(_PhotovoltaicModel value, $Res Function(_PhotovoltaicModel) _then) = __$PhotovoltaicModelCopyWithImpl;
@override @useResult
$Res call({
 PhotovoltaicStatus? status, bool isOverviewEnabled, List<PhotovoltaicExceptionState> exceptionStates, double? currentProduction, String? currentProductionUnit, CurrentStatsByPeriod? productionCumulated, double? installedPeakPower, double? installedPeakPowerConsolidatedTotal, bool hasConsolidatedData
});


@override $CurrentStatsByPeriodCopyWith<$Res>? get productionCumulated;

}
/// @nodoc
class __$PhotovoltaicModelCopyWithImpl<$Res>
    implements _$PhotovoltaicModelCopyWith<$Res> {
  __$PhotovoltaicModelCopyWithImpl(this._self, this._then);

  final _PhotovoltaicModel _self;
  final $Res Function(_PhotovoltaicModel) _then;

/// Create a copy of PhotovoltaicModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? isOverviewEnabled = null,Object? exceptionStates = null,Object? currentProduction = freezed,Object? currentProductionUnit = freezed,Object? productionCumulated = freezed,Object? installedPeakPower = freezed,Object? installedPeakPowerConsolidatedTotal = freezed,Object? hasConsolidatedData = null,}) {
  return _then(_PhotovoltaicModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PhotovoltaicStatus?,isOverviewEnabled: null == isOverviewEnabled ? _self.isOverviewEnabled : isOverviewEnabled // ignore: cast_nullable_to_non_nullable
as bool,exceptionStates: null == exceptionStates ? _self._exceptionStates : exceptionStates // ignore: cast_nullable_to_non_nullable
as List<PhotovoltaicExceptionState>,currentProduction: freezed == currentProduction ? _self.currentProduction : currentProduction // ignore: cast_nullable_to_non_nullable
as double?,currentProductionUnit: freezed == currentProductionUnit ? _self.currentProductionUnit : currentProductionUnit // ignore: cast_nullable_to_non_nullable
as String?,productionCumulated: freezed == productionCumulated ? _self.productionCumulated : productionCumulated // ignore: cast_nullable_to_non_nullable
as CurrentStatsByPeriod?,installedPeakPower: freezed == installedPeakPower ? _self.installedPeakPower : installedPeakPower // ignore: cast_nullable_to_non_nullable
as double?,installedPeakPowerConsolidatedTotal: freezed == installedPeakPowerConsolidatedTotal ? _self.installedPeakPowerConsolidatedTotal : installedPeakPowerConsolidatedTotal // ignore: cast_nullable_to_non_nullable
as double?,hasConsolidatedData: null == hasConsolidatedData ? _self.hasConsolidatedData : hasConsolidatedData // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PhotovoltaicModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentStatsByPeriodCopyWith<$Res>? get productionCumulated {
    if (_self.productionCumulated == null) {
    return null;
  }

  return $CurrentStatsByPeriodCopyWith<$Res>(_self.productionCumulated!, (value) {
    return _then(_self.copyWith(productionCumulated: value));
  });
}
}

// dart format on
