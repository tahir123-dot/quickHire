import 'package:flutter/material.dart';
import 'package:mobile/core/themes/colors.dart';

class AppButtonTheme {
  static Widget iconTextButton({
    required String text,
    required IconData? icon,
    required VoidCallback? onPressed,
    Color backgroundColor = Colors.transparent,
    Color textColor = AppColors.blackColor,
    Color iconColor = AppColors.blackColor,
    Color overlay = AppColors.greyColor,
    double opacity = 0,
    double iconSize = 0,
    double gap = 0,
    Color sideColor = AppColors.blackColor,
    double elevation = 0,
    double height = 50,
    double? width = double.infinity,
    double borderRadius = 50,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: elevation,
          overlayColor: overlay.withValues(alpha: opacity),
          shadowColor: Colors.transparent,
          side: BorderSide(color: sideColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: iconColor, size: iconSize),
              SizedBox(width: gap),
            ],
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
