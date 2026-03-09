import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:presentation/screens/settings/components/menu_item.dart';
import 'package:presentation/screens/settings/components/section_header_item.dart';
import 'package:presentation/theme/app_colors.dart';
import 'package:presentation/theme/app_sizing.dart';
import 'package:presentation/theme/app_typography.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Scaffold(
      backgroundColor: colors.basic.background.default_,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSizing.spacing16,
                  AppSizing.spacing16,
                  AppSizing.spacing16,
                  AppSizing.spacing8,
                ),
                child: Text('Settings', style: typography.h1),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 1,
                children: [
                  const SectionHeaderItem(title: 'GENERAL'),
                  MenuItem(
                    icon: Icons.mail_outline,
                    title: 'Invitation',
                    badgeCount: 1,
                    onTap: () {},
                  ),
                  MenuItem(
                    icon: Icons.person_outline,
                    title: 'Profile',
                    onTap: () {},
                  ),
                  MenuItem(
                    icon: Icons.smartphone_outlined,
                    title: 'App settings',
                    onTap: () {},
                  ),
                  const SectionHeaderItem(title: 'INSTALLATION'),
                  MenuItem(
                    icon: Icons.home_outlined,
                    title: 'General',
                    subtitle: 'Home {Installation name}',
                    onTap: () {},
                  ),
                  MenuItem(
                    icon: Icons.people_outline,
                    title: 'Friends & Family',
                    onTap: () {},
                  ),
                  MenuItem(
                    icon: Icons.location_on_outlined,
                    title: 'Geofencing',
                    onTap: () {},
                  ),
                  MenuItem(
                    icon: Icons.bolt_outlined,
                    title: 'Energy management',
                    onTap: () {},
                  ),
                  MenuItem(
                    icon: Icons.build_outlined,
                    title: 'Contractor',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
