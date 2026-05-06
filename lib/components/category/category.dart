import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/themes/colors.dart';

class Category extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final VoidCallback onTap;

  final double height;
  final double width;
  final Color backgroundColor;
  final Color borderColor;

  const Category({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.onTap,
    this.height = 90,
    this.width = double.infinity,
    this.backgroundColor = AppColors.whiteColor,
    this.borderColor = AppColors.greyColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 144.h, //SizeConfig.blockHeight * 20,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(9.r),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                image,
                width: 90.w,
                height: 74.h,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 13.w),

            // Text
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(description, style: TextStyle(fontSize: 10.sp)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
