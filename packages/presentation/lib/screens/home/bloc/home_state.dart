part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, failure }

@freezed
abstract class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    required HomeStatus status,
    required List<HomeTileData> tiles,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
    status: HomeStatus.initial,
    tiles: [],
  );

  HomeState loading() => copyWith(status: HomeStatus.loading);

  HomeState success({required List<HomeTileData> tiles}) => copyWith(
    status: HomeStatus.success,
    tiles: tiles,
  );

  HomeState failure() => copyWith(status: HomeStatus.failure);

  HomeState withFirstTile(HomeTileData tile) {
    if (tiles.isEmpty) return this;
    return copyWith(tiles: [tile, ...tiles.skip(1)]);
  }
}
