import 'package:flutter/material.dart';
import 'package:mobile/components/category/filter_category/category_list.dart';

import '../../../core/size_config/size_config.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int activeIndex = 0;

  List<String> categories = ["Barber", "Electrician", "Plumber", "Doctor"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 8,),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryList(
            categoryName: categories[index],
            isActive: activeIndex == index,
            onTap: () {
              setState(() {
                activeIndex = index;
              });
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
      ),
    );
  }
}
