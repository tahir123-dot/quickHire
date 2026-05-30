import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/themes/colors.dart';

class ListItemModel {
  final String title;
  final String? route;
  final VoidCallback? onTap;

  ListItemModel({required this.title, this.route, this.onTap});
}

class ListWidget extends StatelessWidget {
  final List<ListItemModel> items;

  const ListWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.searchBarBackground,
        borderRadius: BorderRadius.circular(14.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 11.h),
            child: GestureDetector(
              onTap: () {
                // 🔥 Priority: function first
                if (item.onTap != null) {
                  item.onTap!();
                  return;
                }

                // 🔥 fallback: route
                if (item.route != null && item.route!.isNotEmpty) {
                  context.push(item.route!);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.blackColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.sp,
                    color: AppColors.blackColor,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
