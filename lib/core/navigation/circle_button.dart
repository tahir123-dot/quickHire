import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../themes/colors.dart';

class CircleButton extends StatelessWidget {
  final String? route;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;

  const CircleButton({
    super.key,
    this.route,
    required this.icon,
    this.backgroundColor = AppColors.circleButton,
    this.iconColor = AppColors.arrowForward,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        route != null ? context.go(route!) : context.pop();
      },
      child: CircleAvatar(
        radius: 24,
        backgroundColor: backgroundColor,
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}
