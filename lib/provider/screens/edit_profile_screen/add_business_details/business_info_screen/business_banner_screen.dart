import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/core/themes/colors.dart';

class BusinessBannerScreen extends StatefulWidget {
  const BusinessBannerScreen({super.key});

  @override
  State<BusinessBannerScreen> createState() => _BusinessBannerScreenState();
}

class _BusinessBannerScreenState extends State<BusinessBannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.transparentBackground,
        elevation: 3,
        shadowColor: AppColors.blackColor.withValues(alpha: 0.2),
        title: TopBarIconWithCenterText(pageName: 'Cover'),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 43.w),
          children: [
            SizedBox(height: 23.h),
            Text('Cover Image', style: AppTextTheme.h1),

            SizedBox(height: 17.h),
            Text('Select image which would b show on your profile top'),
            SizedBox(height: 50.h),

            GestureDetector(
              onTap: () {
                // TODO: open gallery
              },
              child: Container(
                width: 131.w,
                height: 246.h,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColors.searchBarBackground,
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 32,
                      color: AppColors.lightgreyColor,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Upload your image here",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 28.h),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 43.w, vertical: 20.h),
        child: // Save button
        AppButtonTheme.iconTextButton(
          text: 'Save',
          icon: null,
          backgroundColor: AppColors.blackColor,
          textColor: AppColors.whiteColor,
          onPressed: () {
            print("Confirm save");
          },
        ),
      ),
    );
  }
}
