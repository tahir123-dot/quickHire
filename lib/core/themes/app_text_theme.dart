import 'package:flutter/material.dart';
import 'package:mobile/core/themes/colors.dart';

import '../size_config/size_config.dart';

class AppTextTheme {
  static TextStyle h1 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    height: 1.4,
    color: AppColors.blackColor,
  );

  static TextStyle paragraph=TextStyle(
    fontSize: SizeConfig.blockWidth*4.0,
    color: AppColors.blackColor,
    height: 1.2,
  );

  static TextStyle otpVerifyTheme =TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w900,
    color: AppColors.blackColor,
  );


}