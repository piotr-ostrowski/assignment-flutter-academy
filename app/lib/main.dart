import 'package:app/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presentation/router/app_router.dart';
import 'package:presentation/theme/app_colors.dart';
import 'package:presentation/theme/app_theme.dart';

void main() async {
  await configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ViCare Academy',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: _router.config(),
      builder: (context, child) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final appColors = context.appColors;

        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
            systemNavigationBarColor: appColors.basic.surface.default_,
            systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
          ),
        );

        return child ?? const SizedBox.shrink();
      },
    );
  }
}
