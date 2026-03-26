part of 'photovoltaic_cubit.dart';

enum PhotovoltaicDetailStatus { initial, loading, success, failure }

@freezed
abstract class PhotovoltaicDetailState with _$PhotovoltaicDetailState {
  const PhotovoltaicDetailState._();

  const factory PhotovoltaicDetailState({
    required PhotovoltaicDetailStatus status,
    PhotovoltaicModel? data,
    PhotovoltaicStatus? liveStatus,
  }) = _PhotovoltaicDetailState;

  factory PhotovoltaicDetailState.initial() => const PhotovoltaicDetailState(
    status: PhotovoltaicDetailStatus.initial,
  );

  PhotovoltaicDetailState loading() => copyWith(status: PhotovoltaicDetailStatus.loading);

  PhotovoltaicDetailState success({required PhotovoltaicModel data}) => copyWith(
    status: PhotovoltaicDetailStatus.success,
    data: data,
  );

  PhotovoltaicDetailState failure() => copyWith(status: PhotovoltaicDetailStatus.failure);

  PhotovoltaicDetailState withLiveStatus(PhotovoltaicStatus status) =>
      copyWith(liveStatus: status);
}
