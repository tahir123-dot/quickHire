import 'package:flutter/material.dart';
import 'package:mobile/core/themes/colors.dart';

class AppInputTheme {
  static InputDecoration withIcon({
    String  labelText = "",
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      label: Text(labelText),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: hint,
      hintStyle: TextStyle(color: AppColors.inputHintPrimary, fontSize: 14),
      filled: false,
      prefixIcon: Icon(icon, color: AppColors.inputIconPrimary, size: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: BorderSide(color: AppColors.greyColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.greyColor),
        borderRadius: BorderRadius.circular(11),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: BorderSide(color: AppColors.borderPrimary, width: 2),
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
        borderSide: BorderSide(color: AppColors.greyColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.greyColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.borderPrimary, width: 2),
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
      fillColor: AppColors.searchBarBackground,
      suffixIcon: icon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: AppColors.searchBarBackground),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: AppColors.searchBarBackground),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: AppColors.searchBarBorder, width: 1),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 11),
    );
  }
}
