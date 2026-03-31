import 'package:flutter/material.dart';
import 'package:mobile/core/themes/colors.dart';

import '../size_config/size_config.dart';

class AppTextTheme {
  static TextStyle h1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  static TextStyle paragraph=TextStyle(
    fontSize: SizeConfig.blockWidth*4.0,
    height: 1.2,
  );


}