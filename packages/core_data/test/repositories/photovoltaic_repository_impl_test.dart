import 'package:core/models/photovoltaic/photovoltaic_exception_state.dart';
import 'package:core/models/photovoltaic/photovoltaic_model.dart';
import 'package:core/models/photovoltaic/photovoltaic_status.dart';
import 'package:core/repositories/photovoltaic_repository.dart';
import 'package:core_data/api/api_service.dart';
import 'package:core_data/repositories/photovoltaic_repository_impl.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ApiService>()])
import 'photovoltaic_repository_impl_test.mocks.dart';

void main() {
  /// Mocked photovoltaic data for testing purposes
  const mockedPhotovoltaicData = PhotovoltaicModel(
    status: PhotovoltaicStatus.production,
    isOverviewEnabled: true,
    exceptionStates: [PhotovoltaicExceptionState.noException],
    currentProduction: 3.5,
    currentProductionUnit: 'kW',
    installedPeakPower: 10.0,
    installedPeakPowerConsolidatedTotal: 10.0,
    hasConsolidatedData: true,
  );

  final apiService = MockApiService();
  late PhotovoltaicRepository repository;

  setUp(() {
    repository = PhotovoltaicRepositoryImpl(apiService: apiService);
  });

  group("Photovoltaic repository test bundle", () {
    test("getPhotovoltaicData returns data from API service", () async {
      when(
        apiService.fetchPhotovoltaicData(),
      ).thenAnswer((_) async => mockedPhotovoltaicData);

      final result = await repository.getPhotovoltaicData();

      expect(result, equals(mockedPhotovoltaicData));
    });

    test("getPhotovoltaicStatusStream emits initial status then periodic statuses", () {
      fakeAsync((FakeAsync async) {
        when(apiService.fetchPhotovoltaicData()).thenAnswer(
          (_) async {
            await Future<void>.delayed(const Duration(milliseconds: 300));
            return mockedPhotovoltaicData;
          },
        );

        final emittedStatuses = <PhotovoltaicStatus>[];
        final subscription = repository.getPhotovoltaicStatusStream().listen(emittedStatuses.add);

        // No emissions before API responds
        expect(emittedStatuses, isEmpty);

        // API responded — initial status emitted
        async.elapse(const Duration(milliseconds: 1));
        expect(emittedStatuses, [PhotovoltaicStatus.production]);

        // First periodic tick
        async.elapse(const Duration(seconds: 2));
        expect(emittedStatuses.length, 2);
        expect(emittedStatuses[1], PhotovoltaicStatus.nothing);

        // Second periodic tick
        async.elapse(const Duration(seconds: 2));
        expect(emittedStatuses.length, 3);
        expect(emittedStatuses[2], PhotovoltaicStatus.ready);

        subscription.cancel();
      });
    });
  });
}
