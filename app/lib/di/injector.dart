import 'package:app/di/injector.config.dart';
import 'package:core_data/di/core_data_module.module.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  includeMicroPackages: true,
  externalPackageModulesBefore: [
    ExternalModule(CoreDataPackageModule),
  ],
)
Future<GetIt> configureDependencies() async => await getIt.init();
