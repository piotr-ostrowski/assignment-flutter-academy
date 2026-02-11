//@GeneratedMicroModule;CoreDataPackageModule;package:core_data/di/core_data_module.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/repositories/photovoltaic_repository.dart' as _i772;
import 'package:core_data/api/api_service.dart' as _i1003;
import 'package:core_data/repositories/photovoltaic_repository_impl.dart'
    as _i1031;
import 'package:injectable/injectable.dart' as _i526;

class CoreDataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i1003.ApiService>(() => _i1003.ApiService());
    gh.lazySingleton<_i772.PhotovoltaicRepository>(() =>
        _i1031.PhotovoltaicRepositoryImpl(apiService: gh<_i1003.ApiService>()));
  }
}
