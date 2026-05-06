import 'package:flutter/material.dart';

class SizeConfig {
  static double? width;
  static double? height;
  static double? blockWidth;
  static double? blockHeight;

  static void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    blockWidth = width! / 100;
    blockHeight = height! / 100;
  }
}
