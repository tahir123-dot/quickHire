import 'package:flutter/material.dart';
import 'package:mobile/components/category/filter_category/category_list.dart';
import '../../../core/size_config/size_config.dart';

class CategorySection extends StatefulWidget {
  final List<String> categories;
  const CategorySection({super.key,required this.categories});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int activeIndex = 0;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 6,),
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
          return SizedBox(width: 10);
        },
      ),
    );
  }
}
