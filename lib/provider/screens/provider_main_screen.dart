import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/navigation/bottom_navigation.dart';

class ProviderMainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const ProviderMainScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigation(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(index);
        },
        icons: const [
          Icons.dashboard_outlined,
          Icons.calendar_today_outlined, // Booking
          Icons.campaign_outlined,
          Icons.account_circle_outlined, // Profile
        ],
        labels: const [
          // labels chahiye to pass karo
          'Dashboard',
          'Bookings',
          'Ads',
          'Profile',
        ],
      ),
    );
  }
}
