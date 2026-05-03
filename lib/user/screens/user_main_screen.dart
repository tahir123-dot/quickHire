import 'package:flutter/material.dart';
import 'package:mobile/core/navigation/bottom_navigation.dart';
import 'package:mobile/export_screen/screen_exports.dart';

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({super.key});

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  int currentIndex = 0;

  final screen = [
    HomeScreen(),
    BookingScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  List<IconData> iconItem = [
    Icons.home,
    Icons.book,
    Icons.chat,
    Icons.person_rounded
  ];

  void onTap(int index){
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
