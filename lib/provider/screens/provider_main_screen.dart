import 'package:flutter/material.dart';
import 'package:mobile/core/navigation/bottom_navigation.dart';
import 'package:mobile/export_screen/screen_exports.dart';

class ProviderMainScreen extends StatefulWidget {
  const ProviderMainScreen({super.key});

  @override
  State<ProviderMainScreen> createState() => _ProviderMainScreenState();
}

class _ProviderMainScreenState extends State<ProviderMainScreen> {
  int currentIndex = 0;

  final screen = [
    ProviderHomeScreen(),
    ProviderBookingScreen(),
    ProfileViewScreen(),
  ];

  List<IconData> iconItem = [Icons.home, Icons.book, Icons.person_rounded];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigation(icons: iconItem, onTap: onTap),
    );
  }
}
