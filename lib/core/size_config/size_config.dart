import 'package:flutter/material.dart';
class SizeConfig {
  static late double width;
  static late double height;
  static late double blockWidth;
  static late double blockHeight;

  static void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    blockWidth = width / 100;
    blockHeight = height / 100;
  }
}