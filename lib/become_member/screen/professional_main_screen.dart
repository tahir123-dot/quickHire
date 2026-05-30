import 'package:flutter/material.dart';
import 'package:mobile/become_member/screen/professional.dart';
import 'package:mobile/core/navigation/bottom_navigation.dart';
import 'package:mobile/export_screen/screen_exports.dart';

class ProfessionalMainScreen extends StatefulWidget {
  const ProfessionalMainScreen({super.key});

  @override
  State<ProfessionalMainScreen> createState() => _ProfessionalMainScreenState();
}

class _ProfessionalMainScreenState extends State<ProfessionalMainScreen> {
  int currentIndex = 0;
  final screen = [
    ProfessionalHomeScreen(),
    ProfessionalScheduleScreen(),
    ProfileScreen(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<IconData> iconItem = [
    Icons.home,
    Icons.eighteen_mp_outlined,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigation(
        icons: iconItem,
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }
}
