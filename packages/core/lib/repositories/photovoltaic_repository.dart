import 'package:core/models/photovoltaic/photovoltaic_model.dart';
import 'package:core/models/photovoltaic/photovoltaic_status.dart';

abstract class PhotovoltaicRepository {
  Future<PhotovoltaicModel> getPhotovoltaicData();

  Stream<PhotovoltaicStatus> getPhotovoltaicStatusStream();
}
