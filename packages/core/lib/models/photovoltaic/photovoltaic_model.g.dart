// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photovoltaic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhotovoltaicModel _$PhotovoltaicModelFromJson(Map<String, dynamic> json) =>
    _PhotovoltaicModel(
      status: $enumDecodeNullable(_$PhotovoltaicStatusEnumMap, json['status']),
      isOverviewEnabled: json['isOverviewEnabled'] as bool,
      exceptionStates: (json['exceptionStates'] as List<dynamic>)
          .map((e) => $enumDecode(_$PhotovoltaicExceptionStateEnumMap, e))
          .toList(),
      currentProduction: (json['currentProduction'] as num?)?.toDouble(),
      currentProductionUnit: json['currentProductionUnit'] as String?,
      productionCumulated: json['productionCumulated'] == null
          ? null
          : CurrentStatsByPeriod.fromJson(
              json['productionCumulated'] as Map<String, dynamic>,
            ),
      installedPeakPower: (json['installedPeakPower'] as num?)?.toDouble(),
      installedPeakPowerConsolidatedTotal:
          (json['installedPeakPowerConsolidatedTotal'] as num?)?.toDouble(),
      hasConsolidatedData: json['hasConsolidatedData'] as bool,
    );

Map<String, dynamic> _$PhotovoltaicModelToJson(_PhotovoltaicModel instance) =>
    <String, dynamic>{
      'status': _$PhotovoltaicStatusEnumMap[instance.status],
      'isOverviewEnabled': instance.isOverviewEnabled,
      'exceptionStates': instance.exceptionStates
          .map((e) => _$PhotovoltaicExceptionStateEnumMap[e]!)
          .toList(),
      'currentProduction': instance.currentProduction,
      'currentProductionUnit': instance.currentProductionUnit,
      'productionCumulated': instance.productionCumulated,
      'installedPeakPower': instance.installedPeakPower,
      'installedPeakPowerConsolidatedTotal':
          instance.installedPeakPowerConsolidatedTotal,
      'hasConsolidatedData': instance.hasConsolidatedData,
    };

const _$PhotovoltaicStatusEnumMap = {
  PhotovoltaicStatus.nothing: 'nothing',
  PhotovoltaicStatus.ready: 'ready',
  PhotovoltaicStatus.production: 'production',
  PhotovoltaicStatus.off: 'off',
  PhotovoltaicStatus.error: 'error',
};

const _$PhotovoltaicExceptionStateEnumMap = {
  PhotovoltaicExceptionState.feedInLimitationActive: 'feedInLimitationActive',
  PhotovoltaicExceptionState.limitEnergyManagementSystemActive:
      'limitEnergyManagementSystemActive',
  PhotovoltaicExceptionState.photovoltaicError: 'photovoltaicError',
  PhotovoltaicExceptionState.photovoltaicTemperatureDeratingPhotovoltaicActive:
      'photovoltaicTemperatureDeratingPhotovoltaicActive',
  PhotovoltaicExceptionState.systemStateIslandModeActive:
      'systemStateIslandModeActive',
  PhotovoltaicExceptionState.systemStateSelfTestActive:
      'systemStateSelfTestActive',
  PhotovoltaicExceptionState.systemStateUpdateInProgress:
      'systemStateUpdateInProgress',
  PhotovoltaicExceptionState.noException: 'noException',
  PhotovoltaicExceptionState.unknown: 'unknown',
};
