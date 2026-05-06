import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/category/filter_category/category_list.dart';

class CategorySection extends StatefulWidget {
  final List<String> categories;
  const CategorySection({super.key, required this.categories});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          return CategoryList(
            categoryName: widget.categories[index],
            isActive: activeIndex == index,
            onTap: () {
              setState(() {
                activeIndex = index;
              });
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10.w);
        },
      ),
    );
  }
}
