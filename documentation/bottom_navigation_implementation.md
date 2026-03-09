# Bottom Navigation Implementation Guide

Instrukcja implementacji bottom navigation bar z `auto_route` w modularnej aplikacji Flutter (Clean Architecture).

---

## Przegląd architektury

Implementacja składa się z czterech warstw:

1. **Tab Flow widgets** – lekkie wrappery `AutoRouter()` dla każdej zakładki
2. **DashboardScreen** – ekran-host z `AutoTabsRouter` i bottom nav bar
3. **AppRouter** – główna konfiguracja routera z zagnieżdżoną strukturą zakładek
4. **MainNavigationBar** – customowy widget bottom navigation bar
5. **ModuleRouting** – abstrakcja routingu w każdym pakiecie funkcjonalnym

---

## Krok 1 – Abstrakcje routingu w `presentation_common`

### `lib/navigation/routing_utils.dart`

```dart
import 'package:flutter/material.dart';

final class Routers {
  Routers._();

  // Konwencja nazewnictwa: usuwa sufiks Screen/Page/Flow i dodaje Route
  static const String replaceInRouteName = 'Screen|Page|Flow,Route';
  static final navigatorKey = GlobalKey<NavigatorState>();
}
```

### `lib/routing/module_routing.dart`

```dart
import 'package:auto_route/auto_route.dart';

abstract class ModuleRouting {
  /// Regularne trasy niezwiązane z zakładką
  List<AutoRoute> get routes;
}
```

---

## Krok 2 – Tab Flow widgets

Plik: `presentation_main/lib/screens/dashboard/dashboard_screen_tabs.dart`

Dla każdej zakładki tworzymy minimalny widget oznaczony `@RoutePage()`, który renderuje tylko `AutoRouter()`. Dzięki temu auto_route może zarządzać własnym stosem nawigacji w obrębie każdej zakładki.

```dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AudioGuideTabFlow extends StatelessWidget {
  const AudioGuideTabFlow({super.key});

  @override
  Widget build(BuildContext context) => AutoRouter();
}

@RoutePage()
class ExhibitionTabFlow extends StatelessWidget {
  const ExhibitionTabFlow({super.key});

  @override
  Widget build(BuildContext context) => AutoRouter();
}

@RoutePage()
class DictionaryTabFlow extends StatelessWidget {
  const DictionaryTabFlow({super.key});

  @override
  Widget build(BuildContext context) => AutoRouter();
}

@RoutePage()
class MenuTabFlow extends StatelessWidget {
  const MenuTabFlow({super.key});

  @override
  Widget build(BuildContext context) => AutoRouter();
}
```

> **Uwaga:** Nazwa klasy musi kończyć się na `Flow` (zgodnie z konwencją `replaceInRouteName`), żeby generator utworzył poprawną nazwę route'a (np. `AudioGuideTabRoute`).

---

## Krok 3 – Routing w pakietach funkcjonalnych

Każdy pakiet funkcjonalny eksportuje własny routing implementujący `ModuleRouting`. Może też eksportować osobny routing dla ekranów pełnoekranowych (bez bottom nav).

### Przykład: `presentation_dictionary/lib/navigation/dictionary_routing.dart`

```dart
import 'package:auto_route/auto_route.dart';
import 'package:presentation_common/navigation/routing_utils.dart';
import 'package:presentation_common/routing/module_routing.dart';
import 'package:presentation_dictionary/navigation/dictionary_routing.gr.dart';

// Trasy wewnątrz zakładki (z bottom nav)
@AutoRouterConfig(replaceInRouteName: Routers.replaceInRouteName)
final class DictionaryRouting extends RootStackRouter implements ModuleRouting {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: DictionaryListRoute.page,
      initial: true,
    ),
    AutoRoute(
      page: DictionaryDetailsRoute.page,
    ),
  ];
}

// Trasy pełnoekranowe (bez bottom nav, poza DashboardScreen)
@AutoRouterConfig(replaceInRouteName: Routers.replaceInRouteName)
final class DictionaryFullScreenRouting extends RootStackRouter implements ModuleRouting {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: DictionaryDetailsFullRoute.page,
    ),
  ];
}
```

---

## Krok 4 – Główna konfiguracja routera (`AppRouter`)

Plik: `presentation_main/lib/router/app_router.dart`

`AppRouter` składa `DashboardRoute` jako root z czterema zakładkami jako dziećmi. Każda zakładka pobiera swoje trasy przez DI (GetIt). Trasy pełnoekranowe są dodawane **na poziomie root** – poza `DashboardRoute` – dzięki czemu wyświetlają się bez bottom nav.

```dart
import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation_audio_guide/navigation/audio_guide_full_screen_routing.dart';
import 'package:presentation_audio_guide/presentation_audio_guide.dart';
import 'package:presentation_common/navigation/routing_utils.dart';
import 'package:presentation_dictionary/navigation/dictionary_routing.dart';
import 'package:presentation_dictionary/navigation/dictionary_routing.gr.dart';
import 'package:presentation_exhibition/navigation/exhibition_routing.dart';
import 'package:presentation_exhibition/navigation/exhibition_routing.gr.dart';
import 'package:presentation_menu/navigation/menu_routing.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: Routers.replaceInRouteName)
class AppRouter extends RootStackRouter {
  AppRouter() : super(navigatorKey: Routers.navigatorKey);

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: DashboardRoute.page,
      initial: true,
      children: [
        // Zakładka 1
        AutoRoute(
          page: AudioGuideTabRoute.page,
          children: GetIt.I<AudioGuideRouting>().routes,
        ),
        // Zakładka 2
        AutoRoute(
          page: ExhibitionTabRoute.page,
          children: [
            ...GetIt.I<ExhibitionRouting>().routes,
            // Cross-tab deeplink: ExhibitionTab może pokazać stronę Dictionary
            AutoRoute(page: DictionaryDetailsRoute.page),
          ],
        ),
        // Zakładka 3
        AutoRoute(
          page: DictionaryTabRoute.page,
          children: [
            ...GetIt.I<DictionaryRouting>().routes,
            // Cross-tab deeplink: DictionaryTab może pokazać stronę Exhibition
            AutoRoute(page: ExhibitionDetailsRoute.page),
          ],
        ),
        // Zakładka 4
        AutoRoute(
          page: MenuTabRoute.page,
          children: GetIt.I<MenuRouting>().routes,
        ),
      ],
    ),

    // Pełnoekranowe trasy POZA bottom nav (dodane na poziomie root)
    ...GetIt.I<AudioGuideFullScreenRouting>().routes,
    ...GetIt.I<DictionaryFullScreenRouting>().routes,
    ...GetIt.I<ExhibitionFullScreenRouting>().routes,
  ];
}
```

> **Kluczowy pattern:** Trasy, które mają być wyświetlane bez bottom navigation bar, dodaje się jako rodzeństwo `DashboardRoute` na poziomie root – a nie jako dzieci zakładek.

> **Cross-tab deeplinks:** Jeśli zakładka A ma potrzebę przejść do ekranu normalnie należącego do zakładki B, należy dodać ten route jako dodatkowe dziecko zakładki A w `AppRouter`.

---

## Krok 5 – DashboardScreen z `AutoTabsRouter`

Plik: `presentation_main/lib/screens/dashboard/dashboard_screen.dart`

```dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:presentation_common/presentation_common.dart';
import '../../router/app_router.gr.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      // Kolejność musi odpowiadać kolejności zakładek w AppRouter
      routes: const [
        AudioGuideTabRoute(),
        ExhibitionTabRoute(),
        DictionaryTabRoute(),
        MenuTabRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          backgroundColor: context.appColors.basic.surface.strongDefault,
          body: SafeArea(
            top: false,
            child: child,
          ),
          bottomNavigationBar: MainNavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
          ),
        );
      },
    );
  }
}
```

---

## Krok 6 – MainNavigationBar widget

Plik: `core_ui/lib/widgets/navigation_bar/navigation_bar.dart`

Customowy widget zamiast `NavigationBar` z Material Design. Używa `InkWell` z `CircleBorder` dla ripple effect i `SvgIcon` zamiast standardowych ikon.

```dart
import 'dart:io';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    super.key,
    this.selectedIndex = 0,
    this.onDestinationSelected,
  });

  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = CoreLocalizations.of(context);
    final colors = context.appColors;

    // Definicja zakładek jako lista rekordów (icon + label)
    final items = [
      (icon: CoreAssets.iconAudioGuide, label: l10n.navigation_audioGuide),
      (icon: CoreAssets.iconExhibition, label: l10n.navigation_exhibition),
      (icon: CoreAssets.iconDictionary, label: l10n.navigation_dictionary),
      (icon: CoreAssets.iconMenu, label: l10n.navigation_menu),
    ];

    return SafeArea(
      top: false,
      left: false,
      right: false,
      // SafeArea bottom tylko na Androidzie – iOS obsługuje to inaczej przez padding
      bottom: Platform.isAndroid,
      child: Container(
        decoration: BoxDecoration(
          color: colors.basic.surface.strongDefault,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: Space.s3,
          horizontal: Space.s4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isSelected = index == selectedIndex;
            final color = isSelected
                ? colors.basic.content.selected
                : colors.action.content.inactive;

            return Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onDestinationSelected?.call(index),
                  customBorder: CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: Space.s2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgIcon(
                          item.icon,
                          size: Sizing.xs,
                          color: color,
                        ),
                        const SizedBox(height: Space.s1),
                        LabelSmall(
                          item.label,
                          color: color,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
```

---

## Diagram przepływu

```
AppRouter (RootStackRouter)
├── DashboardRoute (initial)          ← DashboardScreen z AutoTabsRouter
│   ├── AudioGuideTabRoute            ← AudioGuideTabFlow → AutoRouter()
│   │   └── [audio guide routes]
│   ├── ExhibitionTabRoute            ← ExhibitionTabFlow → AutoRouter()
│   │   ├── [exhibition routes]
│   │   └── DictionaryDetailsRoute   ← cross-tab deeplink
│   ├── DictionaryTabRoute            ← DictionaryTabFlow → AutoRouter()
│   │   ├── [dictionary routes]
│   │   └── ExhibitionDetailsRoute   ← cross-tab deeplink
│   └── MenuTabRoute                  ← MenuTabFlow → AutoRouter()
│       └── [menu routes]
├── [AudioGuide full-screen routes]   ← BEZ bottom nav (root level)
├── [Dictionary full-screen routes]   ← BEZ bottom nav (root level)
└── [Exhibition full-screen routes]   ← BEZ bottom nav (root level)
```

---

## Podsumowanie kluczowych wzorców

| Pattern | Opis |
|---|---|
| **Tab Flow = `AutoRouter()`** | Każda zakładka to osobny stos nawigacji |
| **`AutoTabsRouter`** | Zarządza stanem aktywnej zakładki, przekazuje `activeIndex` i `setActiveIndex` |
| **`ModuleRouting` interface** | Każdy pakiet eksportuje swoje trasy przez DI (GetIt/injectable) |
| **Full-screen na root level** | Ekrany bez bottom nav dodawane obok `DashboardRoute`, nie wewnątrz |
| **Cross-tab deeplink** | Route z innej zakładki dodany explicite jako dziecko zakładki źródłowej |
| **`SafeArea` bottom: `Platform.isAndroid`** | iOS zarządza bottom inset inaczej – `SafeArea` bottom tylko dla Androida |
| **`replaceInRouteName`** | Konwencja `'Screen\|Page\|Flow,Route'` – generator usuwa te sufiksy i dodaje `Route` |
