import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/themes/colors.dart';

class CategoryList extends StatelessWidget {
  final String categoryName;
  final bool isActive;
  final VoidCallback onTap;

  const CategoryList({
    super.key,
    required this.categoryName,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(96.w, 37.h),
        backgroundColor: isActive
            ? Color(0xFF534AB7)
            : AppColors.searchBarBackground,
        shadowColor: Colors.transparent,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
      child: Text(
        categoryName,
        style: TextStyle(
          color: isActive ? AppColors.isActiveText : AppColors.inActiveText,
        ),
      ),
    );
  }
}
