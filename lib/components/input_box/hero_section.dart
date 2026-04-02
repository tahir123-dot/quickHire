import 'package:flutter/material.dart';
import 'package:mobile/core/themes/colors.dart';
import '../../core/size_config/size_config.dart';

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
      height: SizeConfig.blockHeight*22,
      color: AppColors.blackColor,
      child: Image.asset("assets/images/hero.png"),
    );
  }
}
