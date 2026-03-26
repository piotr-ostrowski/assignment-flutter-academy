// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photovoltaic_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PhotovoltaicDetailState implements DiagnosticableTreeMixin {

 PhotovoltaicDetailStatus get status; PhotovoltaicModel? get data; PhotovoltaicStatus? get liveStatus;
/// Create a copy of PhotovoltaicDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotovoltaicDetailStateCopyWith<PhotovoltaicDetailState> get copyWith => _$PhotovoltaicDetailStateCopyWithImpl<PhotovoltaicDetailState>(this as PhotovoltaicDetailState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PhotovoltaicDetailState'))
    ..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('liveStatus', liveStatus));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotovoltaicDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data)&&(identical(other.liveStatus, liveStatus) || other.liveStatus == liveStatus));
}


@override
int get hashCode => Object.hash(runtimeType,status,data,liveStatus);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PhotovoltaicDetailState(status: $status, data: $data, liveStatus: $liveStatus)';
}


}

/// @nodoc
abstract mixin class $PhotovoltaicDetailStateCopyWith<$Res>  {
  factory $PhotovoltaicDetailStateCopyWith(PhotovoltaicDetailState value, $Res Function(PhotovoltaicDetailState) _then) = _$PhotovoltaicDetailStateCopyWithImpl;
@useResult
$Res call({
 PhotovoltaicDetailStatus status, PhotovoltaicModel? data, PhotovoltaicStatus? liveStatus
});


$PhotovoltaicModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$PhotovoltaicDetailStateCopyWithImpl<$Res>
    implements $PhotovoltaicDetailStateCopyWith<$Res> {
  _$PhotovoltaicDetailStateCopyWithImpl(this._self, this._then);

  final PhotovoltaicDetailState _self;
  final $Res Function(PhotovoltaicDetailState) _then;

/// Create a copy of PhotovoltaicDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = freezed,Object? liveStatus = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PhotovoltaicDetailStatus,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PhotovoltaicModel?,liveStatus: freezed == liveStatus ? _self.liveStatus : liveStatus // ignore: cast_nullable_to_non_nullable
as PhotovoltaicStatus?,
  ));
}
/// Create a copy of PhotovoltaicDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotovoltaicModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PhotovoltaicModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [PhotovoltaicDetailState].
extension PhotovoltaicDetailStatePatterns on PhotovoltaicDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotovoltaicDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotovoltaicDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotovoltaicDetailState value)  $default,){
final _that = this;
switch (_that) {
case _PhotovoltaicDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotovoltaicDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _PhotovoltaicDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PhotovoltaicDetailStatus status,  PhotovoltaicModel? data,  PhotovoltaicStatus? liveStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotovoltaicDetailState() when $default != null:
return $default(_that.status,_that.data,_that.liveStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PhotovoltaicDetailStatus status,  PhotovoltaicModel? data,  PhotovoltaicStatus? liveStatus)  $default,) {final _that = this;
switch (_that) {
case _PhotovoltaicDetailState():
return $default(_that.status,_that.data,_that.liveStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PhotovoltaicDetailStatus status,  PhotovoltaicModel? data,  PhotovoltaicStatus? liveStatus)?  $default,) {final _that = this;
switch (_that) {
case _PhotovoltaicDetailState() when $default != null:
return $default(_that.status,_that.data,_that.liveStatus);case _:
  return null;

}
}

}

/// @nodoc


class _PhotovoltaicDetailState extends PhotovoltaicDetailState with DiagnosticableTreeMixin {
  const _PhotovoltaicDetailState({required this.status, this.data, this.liveStatus}): super._();
  

@override final  PhotovoltaicDetailStatus status;
@override final  PhotovoltaicModel? data;
@override final  PhotovoltaicStatus? liveStatus;

/// Create a copy of PhotovoltaicDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotovoltaicDetailStateCopyWith<_PhotovoltaicDetailState> get copyWith => __$PhotovoltaicDetailStateCopyWithImpl<_PhotovoltaicDetailState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PhotovoltaicDetailState'))
    ..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('data', data))..add(DiagnosticsProperty('liveStatus', liveStatus));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotovoltaicDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data)&&(identical(other.liveStatus, liveStatus) || other.liveStatus == liveStatus));
}


@override
int get hashCode => Object.hash(runtimeType,status,data,liveStatus);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PhotovoltaicDetailState(status: $status, data: $data, liveStatus: $liveStatus)';
}


}

/// @nodoc
abstract mixin class _$PhotovoltaicDetailStateCopyWith<$Res> implements $PhotovoltaicDetailStateCopyWith<$Res> {
  factory _$PhotovoltaicDetailStateCopyWith(_PhotovoltaicDetailState value, $Res Function(_PhotovoltaicDetailState) _then) = __$PhotovoltaicDetailStateCopyWithImpl;
@override @useResult
$Res call({
 PhotovoltaicDetailStatus status, PhotovoltaicModel? data, PhotovoltaicStatus? liveStatus
});


@override $PhotovoltaicModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$PhotovoltaicDetailStateCopyWithImpl<$Res>
    implements _$PhotovoltaicDetailStateCopyWith<$Res> {
  __$PhotovoltaicDetailStateCopyWithImpl(this._self, this._then);

  final _PhotovoltaicDetailState _self;
  final $Res Function(_PhotovoltaicDetailState) _then;

/// Create a copy of PhotovoltaicDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = freezed,Object? liveStatus = freezed,}) {
  return _then(_PhotovoltaicDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PhotovoltaicDetailStatus,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PhotovoltaicModel?,liveStatus: freezed == liveStatus ? _self.liveStatus : liveStatus // ignore: cast_nullable_to_non_nullable
as PhotovoltaicStatus?,
  ));
}

/// Create a copy of PhotovoltaicDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotovoltaicModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PhotovoltaicModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
