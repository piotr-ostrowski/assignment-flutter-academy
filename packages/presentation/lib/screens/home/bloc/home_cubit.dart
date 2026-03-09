import 'dart:async';

import 'package:core/models/photovoltaic/photovoltaic_model.dart';
import 'package:core/models/photovoltaic/photovoltaic_status.dart';
import 'package:core/repositories/photovoltaic_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required PhotovoltaicRepository photovoltaicRepository})
      : _repository = photovoltaicRepository,
        super(HomeState.initial());

  final PhotovoltaicRepository _repository;
  StreamSubscription<PhotovoltaicStatus>? _statusSubscription;

  Future<void> loadData() async {
    emit(state.loading());
    try {
      final data = await _repository.getPhotovoltaicData();
      emit(state.success(photovoltaicData: data));

      _statusSubscription?.cancel();
      _statusSubscription = _repository.getPhotovoltaicStatusStream().listen(
        (status) => emit(state.withPhotovoltaicStatus(status)),
        onError: (Object error, StackTrace stackTrace) {},
      );
    } catch (e) {
      emit(state.failure());
    }
  }

  @override
  Future<void> close() {
    _statusSubscription?.cancel();
    return super.close();
  }
}
