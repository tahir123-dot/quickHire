import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/themes/app_text_theme.dart';

import '../../../../core/themes/app_button_theme.dart';
import '../../../../core/themes/app_input_theme.dart';
import '../../../../core/themes/colors.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarIconWithCenterText(pageName: 'Add Services'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 33.w),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 42.h),

                Text('Add Services', style: AppTextTheme.h1),
                SizedBox(height: 15.h),
                Text(
                  "Add a service to make it available for customers to book.",
                ),

                SizedBox(height: 26.h),

                TextFormField(
                  decoration: AppInputTheme.withIcon(
                    hint: 'Service Category',
                    icon: Icons.arrow_drop_down_sharp,
                  ),
                ),

                SizedBox(height: 14.h),

                TextFormField(
                  decoration: AppInputTheme.withIcon(
                    hint: 'Service Name',
                    icon: Icons.miscellaneous_services,
                  ),
                ),

                SizedBox(height: 14.h),

                TextFormField(
                  decoration: AppInputTheme.withIcon(
                    hint: 'Rs 300.0',
                    icon: Icons.money,
                  ),
                ),

                SizedBox(height: 14.h),

                TextFormField(
                  decoration: AppInputTheme.withIcon(
                    hint: '60 min',
                    icon: Icons.watch_later_outlined,
                  ),
                ),

                SizedBox(height: 227.h),

                AppButtonTheme.iconTextButton(
                  text: 'Add',
                  icon: Icons.add_task,
                  backgroundColor: AppColors.blackColor,
                  textColor: AppColors.whiteColor,
                  onPressed: () {
                    print("Service added");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
