import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/themes/colors.dart';

class ServiceList extends StatelessWidget {
  final String serviceName;
  const ServiceList({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {}, // disabled
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkBlueColor,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(color: AppColors.darkBlueColor),
        ),
        fixedSize: Size(120.w, 10.h), //SizeConfig.blockWidth * 30, 10),
      ),
      child: Text(
        serviceName,
        style: TextStyle(color: AppColors.whiteColor, fontSize: 14),
      ),
    );
  }
}
