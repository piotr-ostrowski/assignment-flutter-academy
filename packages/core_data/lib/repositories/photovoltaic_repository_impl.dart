import 'package:core/models/photovoltaic/photovoltaic_model.dart';
import 'package:core/models/photovoltaic/photovoltaic_status.dart';
import 'package:core/repositories/photovoltaic_repository.dart';
import 'package:core_data/api/api_service.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: PhotovoltaicRepository)
class PhotovoltaicRepositoryImpl implements PhotovoltaicRepository {
  final ApiService _apiService;

  const PhotovoltaicRepositoryImpl({required ApiService apiService}) : _apiService = apiService;

  @override
  Future<PhotovoltaicModel> getPhotovoltaicData() {
    return _apiService.fetchPhotovoltaicData();
  }

  @override
  Stream<PhotovoltaicStatus> getPhotovoltaicStatusStream() {
    final periodicStream = Stream<PhotovoltaicStatus>.periodic(
      const Duration(seconds: 2),
      (count) => PhotovoltaicStatus.values[count % PhotovoltaicStatus.values.length],
    );

    final initialStatus = Stream.fromFuture(
      _apiService.fetchPhotovoltaicData(),
    ).map((model) => model.status).whereType<PhotovoltaicStatus>();

    return Rx.concat([initialStatus, periodicStream]);
  }
}
