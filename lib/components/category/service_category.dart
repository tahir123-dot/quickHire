import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/themes/colors.dart';

class ServiceCategory extends StatelessWidget {
  final String title;
  final IconData? icon;
  final String route;

  const ServiceCategory({
    super.key,
    required this.title,
    this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: () {
        context.go(route);
      },
      child: Container(
        width: 160.w,
        height: 134.h,
        padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 18.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.blackColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 35.sp),
            SizedBox(height: 18.h),
            Text(
              title,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
