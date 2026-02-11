import 'package:core/models/photovoltaic/photovoltaic_model.dart';
import 'package:core/models/photovoltaic/photovoltaic_status.dart';
import 'package:core/repositories/photovoltaic_repository.dart';
import 'package:core_data/api/api_service.dart';
import 'package:injectable/injectable.dart';

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
    return Stream<PhotovoltaicStatus>.periodic(const Duration(seconds: 1), (count) {
      final statuses = PhotovoltaicStatus.values;
      return statuses[count % statuses.length];
    });
  }
}
