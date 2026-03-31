import 'package:flutter/material.dart';
import 'package:mobile/core/themes/colors.dart';

class AppInputTheme {
  static InputDecoration withIcon({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: AppColors.inputHintPrimary, fontSize: 14),
      filled: false,
      prefixIcon: Icon(icon, color: AppColors.inputIconPrimary, size: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: BorderSide(color: AppColors.borderPrimary),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderPrimary),
        borderRadius: BorderRadius.circular(11),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: BorderSide(color: AppColors.borderPrimary, width: 1),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 9),
    );
  }

  // for OTP
  static InputDecoration forOTP({required String hint}) {
    return InputDecoration(
      hintText: hint,
      counterText: '', // maxLength ka counter hide karne ke liye
      hintStyle: TextStyle(color: AppColors.inputHintPrimary, fontSize: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.borderPrimary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.borderPrimary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.blueColor, width: 2),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
    );
  }

  // for Search Bar
  static InputDecoration searchBar({
    required String hint,
    required Widget icon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: AppColors.inputHintPrimary, fontSize: 14),
      filled: true,
      fillColor: AppColors.searchBarColor,
      suffixIcon: icon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: AppColors.searchBarColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: AppColors.searchBarColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: AppColors.searchBarBorder, width: 1),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 11),
    );
  }
}
