import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/themes/colors.dart';

class AppInputTheme {
  static InputDecoration withIcon({
    String labelText = "",
    required String hint,
    IconData? icon,
  }) {
    return InputDecoration(
      label: Text(labelText),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: hint,
      hintStyle: TextStyle(color: AppColors.inputHintPrimary, fontSize: 15.sp),
      filled: false,
      prefixIcon: icon != null
          ? Icon(icon, color: AppColors.inputIconPrimary, size: 20.sp)
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13.r),
        borderSide: BorderSide(color: AppColors.greyColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.greyColor),
        borderRadius: BorderRadius.circular(13.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13.r),
        borderSide: BorderSide(color: AppColors.borderPrimary, width: 1),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 18.w),
    );
  }

  // for OTP
  static InputDecoration forOTP({required String hint}) {
    return InputDecoration(
      hintText: hint,
      counterText: '', // maxLength ka counter hide karne ke liye
      hintStyle: TextStyle(color: AppColors.inputHintPrimary, fontSize: 14.sp),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide(color: AppColors.greyColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide(color: AppColors.greyColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: BorderSide(color: AppColors.borderPrimary, width: 1),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.h),
    );
  }

  // for Search Bar
  static InputDecoration searchBar({
    required String hint,
    required Widget icon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: AppColors.inputHintPrimary, fontSize: 15.sp),
      filled: true,
      fillColor: AppColors.searchBarBackground,
      suffixIcon: icon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.r),
        borderSide: BorderSide(color: AppColors.searchBarBackground),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.r),
        borderSide: BorderSide(color: AppColors.searchBarBackground),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.r),
        borderSide: BorderSide(color: AppColors.searchBarBorder, width: 1),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 14.w),
    );
  }
}
