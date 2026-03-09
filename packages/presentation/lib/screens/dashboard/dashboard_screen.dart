import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/main_navigation_bar.dart';
import 'package:presentation/router/app_router.gr.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeTabRoute(),
        NotificationsTabRoute(),
        AnalysisTabRoute(),
        ViCarePlusTabRoute(),
        SettingsTabRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: MainNavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
          ),
        );
      },
    );
  }
}
