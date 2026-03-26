// ignore_for_file: unused_import
import 'package:auto_route/auto_route.dart';
import 'package:presentation/screens/dashboard/dashboard_screen.dart';
import 'package:presentation/screens/dashboard/dashboard_tab_flows.dart';
import 'package:presentation/screens/home/home_screen.dart';
import 'package:presentation/screens/notifications/notifications_screen.dart';
import 'package:presentation/screens/analysis/analysis_screen.dart';
import 'package:presentation/screens/vicare_plus/vicare_plus_screen.dart';
import 'package:presentation/screens/settings/settings_screen.dart';
import 'package:presentation/screens/photovoltaic/photovoltaic_screen.dart';
import 'package:presentation/screens/photovoltaic/photovoltaic_mode_screen.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page|Flow,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: DashboardRoute.page,
          initial: true,
          path: '/',
          children: [
            AutoRoute(
              page: HomeTabRoute.page,
              initial: true,
              path: 'home',
              children: [
                AutoRoute(page: HomeRoute.page, initial: true, path: ''),
                AutoRoute(page: PhotovoltaicRoute.page, path: 'photovoltaic'),
                AutoRoute(page: PhotovoltaicModeRoute.page, path: 'photovoltaic-mode'),
              ],
            ),
            AutoRoute(
              page: NotificationsTabRoute.page,
              children: [
                AutoRoute(page: NotificationsRoute.page, initial: true),
              ],
            ),
            AutoRoute(
              page: AnalysisTabRoute.page,
              children: [
                AutoRoute(page: AnalysisRoute.page, initial: true),
              ],
            ),
            AutoRoute(
              page: ViCarePlusTabRoute.page,
              children: [
                AutoRoute(page: ViCarePlusRoute.page, initial: true),
              ],
            ),
            AutoRoute(
              page: SettingsTabRoute.page,
              children: [
                AutoRoute(page: SettingsRoute.page, initial: true),
              ],
            ),
          ],
        ),
      ];
}
