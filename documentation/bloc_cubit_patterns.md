# BLoC / Cubit — Wzorce i konwencje

Dokument opisuje sposób pracy z BLoC/Cubit w projekcie Oshpitzin, na podstawie
implementacji `DictionaryDetailsCubit` i `DictionaryListCubit`.

---

## 1. Kiedy używać Cubit, a kiedy Bloc?

**Domyślnie używamy `Cubit`.**

`Bloc` stosujemy tylko wtedy, gdy potrzebujemy reagować na strumień zdarzeń
(`Events`) z pełnym śledzeniem historii (np. analytics, skomplikowane transformacje
zdarzeń z `EventTransformer`). W praktyce w tym projekcie prawie zawsze wystarczy
`Cubit`.

---

## 2. Struktura plików

Każdy Cubit żyje w katalogu `bloc/` wewnątrz katalogu danego ekranu:

```
screens/
└── dictionary_details/
    ├── bloc/
    │   ├── dictionary_details_cubit.dart        # Cubit + part directives
    │   ├── dictionary_details_cubit.freezed.dart # Wygenerowany przez freezed
    │   └── dictionary_details_state.dart        # State (part of cubit)
    ├── dictionary_details_screen.dart
    └── widgets/
```

### Reguły plików

| Plik | Zawartość |
|------|-----------|
| `*_cubit.dart` | Klasa Cubit, importy, `part` directives |
| `*_state.dart` | `part of` cubit, enum statusu, klasa State (`@freezed`) |
| `*_cubit.freezed.dart` | **Nie edytujemy** — generowany przez `build_runner` |

---

## 3. State — wzorzec z `@freezed`

State to **jedna niemutowalna klasa** z polami dla wszystkich możliwych danych ekranu.
Używamy `@freezed` i dodajemy **prywatny konstruktor `const ..._()` oraz metody
pomocnicze** do przejść między stanami.

```dart
// dictionary_details_state.dart
part of 'dictionary_details_cubit.dart';

enum DictionaryDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
abstract class DictionaryDetailsState with _$DictionaryDetailsState {
  const DictionaryDetailsState._(); // wymagany dla metod pomocniczych

  const factory DictionaryDetailsState({
    required DictionaryDetailsStatus status,
    required DictionaryEntry? dictionaryEntry,
  }) = _DictionaryDetailsState;

  /// Stan początkowy
  factory DictionaryDetailsState.initial() => const DictionaryDetailsState(
    status: DictionaryDetailsStatus.initial,
    dictionaryEntry: null,
  );

  /// Metody pomocnicze — przejścia między stanami
  DictionaryDetailsState loading() => copyWith(
    status: DictionaryDetailsStatus.loading,
  );

  DictionaryDetailsState success({required DictionaryEntry dictionaryEntry}) =>
      copyWith(
        status: DictionaryDetailsStatus.success,
        dictionaryEntry: dictionaryEntry,
      );

  DictionaryDetailsState failure() => copyWith(
    status: DictionaryDetailsStatus.failure,
  );
}
```

### Zasady projektowania State

- **Jeden State na Cubit** — nie tworzymy wielu klas State z union types (np. `StateLoading | StateSuccess`). Wolimy jedno pole `status` jako enum.
- **Metody pomocnicze zamiast surowego `copyWith` w Cubicie** — przejścia stanów są
  czytelnie nazwane i enkapsulowane w klasie State.
- **Enum statusu** zawsze zawiera: `initial`, `loading`, `success`, `failure`.
- Dane ładowane asynchronicznie są **nullable** w stanie `initial`/`loading`/`failure`.

---

## 4. Cubit — wzorzec implementacji

```dart
// dictionary_details_cubit.dart
part 'dictionary_details_cubit.freezed.dart';
part 'dictionary_details_state.dart';

class DictionaryDetailsCubit extends Cubit<DictionaryDetailsState> {
  DictionaryDetailsCubit({
    required this.termId,
    required DictionaryEntryUseCase dictionaryEntryUseCase,
    required DeeplinkNavigationService deeplinkNavigationService,
  }) : _dictionaryEntryUseCase = dictionaryEntryUseCase,
       _deeplinkNavigationService = deeplinkNavigationService,
       super(DictionaryDetailsState.initial()); // zawsze initial()

  final int termId;
  final DictionaryEntryUseCase _dictionaryEntryUseCase; // prywatne zależności
  final DeeplinkNavigationService _deeplinkNavigationService;

  StreamSubscription<DictionaryEntry>? _entrySubscription; // subskrypcja strumienia

  void loadData() {
    emit(state.loading()); // metoda pomocnicza State

    _entrySubscription?.cancel(); // anuluj poprzednią subskrypcję
    _entrySubscription = _dictionaryEntryUseCase
        .getDictionaryEntry(termId)
        .listen(
          (entry) => emit(state.success(dictionaryEntry: entry)),
          onError: (Object error, StackTrace stackTrace) {
            log.e('...', stackTrace: stackTrace);
            emit(state.failure());
          },
        );
  }

  @override
  Future<void> close() {
    _entrySubscription?.cancel(); // ZAWSZE anuluj subskrypcje
    return super.close();
  }
}
```

### Zasady implementacji Cubit

- **Zależności przez konstruktor** (`required`), a nie przez `GetIt.I<>()` bezpośrednio.
  `GetIt` wywołujemy tylko w ekranie przy tworzeniu Cubita.
- **Zależności publiczne vs prywatne**: parametry konstruktora zapisujemy jako prywatne
  pola (`_useCase`), chyba że muszą być dostępne z zewnątrz.
- **Strumienie (`Stream`)**: subskrypcja (`StreamSubscription`) przechowywana jako pole,
  anulowana w `close()` i przed każdym nowym nasłuchiwaniem (`cancel()` przed nowym
  `listen()`).
- **Logowanie błędów**: używamy `log.e(...)` z `core_common/logging/app_logger.dart`.
  Zawsze przekazujemy `stackTrace`.
- **Emit**: zawsze przez metody pomocnicze State (`state.loading()`, `state.success(...)`,
  `state.failure()`), nigdy bezpośrednio przez `copyWith` w Cubicie.

---

## 5. Ekran — tworzenie i dostarczanie Cubita

Cubit tworzony jest w **metodzie `build` ekranu-korzenia** (`@RoutePage`), nie w
`initState`. Ekran jest `StatelessWidget`.

```dart
@RoutePage()
class DictionaryDetailsScreen extends StatelessWidget {
  final int termId;

  const DictionaryDetailsScreen({super.key, @PathParam() required this.termId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DictionaryDetailsCubit(
            termId: termId,
            dictionaryEntryUseCase: GetIt.I<DictionaryEntryUseCase>(), // DI tutaj
            deeplinkNavigationService: GetIt.I<DeeplinkNavigationService>(),
          )..loadData(), // inicjalizacja od razu po utworzeniu
        ),
        BlocProvider(
          create: (context) => TextSizeCubit(...)..init(),
        ),
      ],
      child: const _DictionaryDetailsScreenContent(),
    );
  }
}
```

### Podział na dwa widgety

Ekran **zawsze** dzieli się na dwa widgety:

| Widget | Rola |
|--------|------|
| `DictionaryDetailsScreen` | `@RoutePage`, tworzy `BlocProvider`/`MultiBlocProvider`, brak UI |
| `_DictionaryDetailsScreenContent` | Prywatny `StatelessWidget`, cały UI, korzysta z Cubita przez `context` |

To oddzielenie zapewnia, że `_Content` ma dostęp do Cubita przez `context.read` /
`BlocBuilder`.

---

## 6. Odczyt stanu w UI

### `BlocBuilder` — pełne przebudowanie widgetu

Stosujemy gdy cały widget zależy od stanu Cubita.

```dart
BlocBuilder<DictionaryDetailsCubit, DictionaryDetailsState>(
  builder: (context, state) {
    if (state.status == DictionaryDetailsStatus.loading ||
        state.status == DictionaryDetailsStatus.initial ||
        state.dictionaryEntry == null) {
      return const LoadingStateIndicator();
    }
    if (state.status == DictionaryDetailsStatus.failure) {
      return ErrorStateIndicator(message: l10n.dictionaryDetails_loadingError);
    }
    return /* widget z danymi */;
  },
),
```

### `BlocSelector` — optymalizacja, przebudowanie tylko przy zmianie wybranego pola

Stosujemy gdy widget zależy tylko od jednego pola stanu.

```dart
BlocSelector<TextSizeCubit, TextSizeState, TextSizeLevel>(
  selector: (state) => state.textSizeLevel,
  builder: (context, textSizeLevel) {
    return SomeWidget(textSizeLevel: textSizeLevel);
  },
),
```

### `context.read` — wywołanie metody bez nasłuchiwania

Stosujemy w callbackach (onPressed, onChanged, etc.), gdy nie potrzebujemy stanu.

```dart
onChanged: (query) {
  context.read<DictionaryListCubit>().searchQueryChanged(query);
},
```

---

## 7. Stany ładowania — konwencja UI

Zawsze obsługujemy wszystkie cztery stany w `BlocBuilder`:

```dart
// 1. Initial + Loading → wskaźnik ładowania
if (state.status == DictionaryListStatus.loading ||
    state.status == DictionaryListStatus.initial) {
  return const LoadingStateIndicator();
}

// 2. Failure → komunikat błędu
if (state.status == DictionaryListStatus.failure) {
  return ErrorStateIndicator(message: l10n.dictionary_loadingError);
}

// 3. Pusty wynik → komunikat braku danych
if (state.filteredTerms.isEmpty) {
  return EmptyStateIndicator(message: l10n.dictionary_noResults);
}

// 4. Success z danymi → właściwy UI
return DictionaryStickyHeaderList(...);
```

Używamy widgetów z `core_ui`:
- `LoadingStateIndicator` — dla `initial` i `loading`
- `ErrorStateIndicator` — dla `failure`
- `EmptyStateIndicator` — dla pustych wyników w stanie `success`

---

## 8. Szybka checklista — nowy Cubit

- [ ] Katalog `screens/feature_name/bloc/`
- [ ] `feature_name_state.dart` jako `part of` cubit
- [ ] Enum `FeatureNameStatus` z: `initial`, `loading`, `success`, `failure`
- [ ] `@freezed` State z prywatnym konstruktorem `const ..._.()`
- [ ] Metoda `FeatureNameState.initial()` factory
- [ ] Metody pomocnicze: `loading()`, `success(...)`, `failure()`
- [ ] Cubit inicjalizowany stanem `super(FeatureNameState.initial())`
- [ ] Zależności jako prywatne pola
- [ ] `StreamSubscription` anulowana w `close()` i przed każdym `listen()`
- [ ] Cubit tworzony w `@RoutePage` ekranie przez `BlocProvider` + `GetIt.I<>()`
- [ ] Ekran podzielony na widget-root i `_Content`
- [ ] UI obsługuje wszystkie 4 stany
