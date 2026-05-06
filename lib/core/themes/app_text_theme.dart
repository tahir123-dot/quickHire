import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/themes/colors.dart';

class AppTextTheme {
  static TextStyle h1 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    height: 1.4.sp,
    color: AppColors.blackColor,
  );

  static TextStyle paragraph = TextStyle(
    fontSize: 15.sp, //SizeConfig.blockWidth*4.0,
    color: AppColors.blackColor,
    height: 1.2.sp,
  );

  static TextStyle otpVerifyTheme = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w900,
    color: AppColors.blackColor,
  );
}
