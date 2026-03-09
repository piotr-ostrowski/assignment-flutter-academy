part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, failure }

@freezed
abstract class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    required HomeStatus status,
    PhotovoltaicModel? photovoltaicData,
    PhotovoltaicStatus? photovoltaicStatus,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
    status: HomeStatus.initial,
  );

  HomeState loading() => copyWith(status: HomeStatus.loading);

  HomeState success({required PhotovoltaicModel photovoltaicData}) => copyWith(
    status: HomeStatus.success,
    photovoltaicData: photovoltaicData,
  );

  HomeState failure() => copyWith(status: HomeStatus.failure);

  HomeState withPhotovoltaicStatus(PhotovoltaicStatus newStatus) =>
      copyWith(photovoltaicStatus: newStatus);
}
