import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/themes/colors.dart';

class CategoryList extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  final bool isActive;
  final VoidCallback onTap;

  const CategoryList({
    super.key,
    required this.imageUrl,
    required this.categoryName,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 75,
              height: 64,
              decoration: BoxDecoration(
                color: isActive
                    ? Color(0xffeeedfe)
                    : AppColors.searchBarBackground,
                borderRadius: BorderRadius.circular(10.r),
                border: isActive
                    ? Border.all(width: 1.5, color: Color(0xff534ab7))
                    : null,
              ),
              child: Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
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
            ),
            SizedBox(height: 8.h),
            Text(
              categoryName,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
