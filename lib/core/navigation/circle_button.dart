import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../themes/colors.dart';

class CircleButton extends StatelessWidget {
  final String route;
  final IconData? icon;

  const CircleButton({super.key, required this.route, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(route),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: AppColors.circleButton,
        child: Icon(icon, color: AppColors.arrowForward),
      ),
    );
  }
}
