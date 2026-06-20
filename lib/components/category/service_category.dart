import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/themes/colors.dart';

class ServiceCategory extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String route;

  const ServiceCategory({
    super.key,
    required this.title,
    required this.imageUrl,
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
            Center(
              child: SizedBox(
                width: 30.w,
                height: 30.h,
                child: SvgPicture.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  placeholderBuilder: (context) => SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.image_not_supported,
                      size: 24.r,
                      color: AppColors.blackColor,
                    );
                  },
                ),
              ),
            ),

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
