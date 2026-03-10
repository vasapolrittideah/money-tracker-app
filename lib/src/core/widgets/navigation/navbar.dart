import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remixicon/remixicon.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
        },
        destinations: [
          NavigationDestination(icon: Icon(RemixIcons.home_line), label: 'หลัก'),
          NavigationDestination(icon: Icon(RemixIcons.wallet_line), label: 'ธุรกรรม'),
          NavigationDestination(icon: Icon(RemixIcons.settings_line), label: 'ตั้งค่า'),
        ],
      ),
    );
  }
}
