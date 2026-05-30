import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/navigation/bottom_navigation.dart';

class UserMainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const UserMainScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (navigationShell.currentIndex != 0) {
          // Chat, Booking, Profile pe hai — Home pe bhejo
          navigationShell.goBranch(0, initialLocation: true);
        } else {
          // Pehle se Home pe hai — app band karo
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigation(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) {
            navigationShell.goBranch(index);
          },
          icons: const [
            Icons.home_outlined,
            Icons.calendar_month_outlined,
            Icons.chat_outlined,
            Icons.person_outline,
          ],
        ),
      ),
    );
  }
}
