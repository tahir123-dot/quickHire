import 'package:flutter/material.dart';
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
        backgroundColor: isActive ? Colors.black : AppColors.searchBarColor,
        shadowColor: Colors.transparent,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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
