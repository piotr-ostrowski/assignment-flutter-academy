import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'package:core/models/photovoltaic/photovoltaic_model.dart';

@lazySingleton
class ApiService {
  static const _photovoltaicAssetPath = 'packages/core_data/assets/photovoltaic_sample.json';

  Future<PhotovoltaicModel> fetchPhotovoltaicData() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final jsonString = await rootBundle.loadString(_photovoltaicAssetPath);
    return PhotovoltaicModel.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
  }
}
