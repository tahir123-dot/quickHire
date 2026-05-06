import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/themes/colors.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h, //SizeConfig.blockHeight*22,
      color: AppColors.blackColor,
      child: Image.asset("assets/images/hero.png"),
    );
  }
}
