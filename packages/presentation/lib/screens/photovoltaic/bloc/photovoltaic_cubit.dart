import 'dart:async';

import 'package:core/models/photovoltaic/photovoltaic_model.dart';
import 'package:core/models/photovoltaic/photovoltaic_status.dart';
import 'package:core/repositories/photovoltaic_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photovoltaic_cubit.freezed.dart';
part 'photovoltaic_state.dart';

class PhotovoltaicCubit extends Cubit<PhotovoltaicDetailState> {
  PhotovoltaicCubit({required PhotovoltaicRepository photovoltaicRepository})
    : _repository = photovoltaicRepository,
      super(PhotovoltaicDetailState.initial());

  final PhotovoltaicRepository _repository;
  StreamSubscription<PhotovoltaicStatus>? _statusSubscription;

  Future<void> loadData() async {
    emit(state.loading());
    try {
      final data = await _repository.getPhotovoltaicData();
      emit(state.success(data: data));

      _statusSubscription?.cancel();
      _statusSubscription = _repository.getPhotovoltaicStatusStream().listen(
        (status) {
          emit(state.withLiveStatus(status));
        },
        onError: (Object error, StackTrace stackTrace) {
          if (kDebugMode) {
            print('Error in photovoltaic status stream: $error');
          }
        },
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
