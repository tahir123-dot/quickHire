import 'package:flutter/material.dart';

import '../themes/colors.dart';

class BottomNavigation extends StatelessWidget {
  final List<IconData> icons;
  final Function(int) onTap;

  const BottomNavigation({super.key, required this.icons, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 25,
              spreadRadius: 1,
              offset: Offset(0, -2), // 🔥 negative Y = shadow upar
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            return IconButton(
              onPressed: () => onTap(index),
              icon: Icon(icons[index]),
            );
          }),
        ),
      );
  }
}
