import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/core/themes/colors.dart';

class BusinessDetailsScreen extends StatefulWidget {
  const BusinessDetailsScreen({super.key});

  @override
  State<BusinessDetailsScreen> createState() => _BusinessDetailsScreenState();
}

class _BusinessDetailsScreenState extends State<BusinessDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.transparentBackground,
        elevation: 3,
        shadowColor: AppColors.blackColor.withValues(alpha: 0.2),
        title: TopBarIconWithCenterText(pageName: 'Business Info'),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 43.w),
          children: [
            SizedBox(height: 22.h),
            Text(
              'Business details',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),

            SizedBox(height: 25.h),

            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  // TODO: open gallery
                },
                child: Container(
                  width: 131.w,
                  height: 131.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt, size: 22, color: Colors.grey),
                      SizedBox(height: 10.h),
                      Text(
                        "Upload",
                        style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 28.h),

            Text(
              'Business Info',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),

            SizedBox(height: 17.h),
            Text('Choose the name displayed on your online booking profile'),
            SizedBox(height: 42.h),

            // Business name
            RichText(
              text: const TextSpan(
                text: "Business name",
                style: TextStyle(color: Colors.black),
              ),
            ),

            const SizedBox(height: 8),

            /// Input
            TextFormField(
              decoration: AppInputTheme.withIcon(
                hint: 'Vibrex',
                icon: Icons.business,
              ),
            ),

            SizedBox(height: 19.h),

            // Description
            RichText(
              text: const TextSpan(
                text: "Description",
                style: TextStyle(color: Colors.black),
              ),
            ),

            const SizedBox(height: 8),

            /// Input
            TextFormField(
              maxLines: 7, // 👈 box height bada ho jata hai
              minLines: 5,
              keyboardType: TextInputType.multiline,

              decoration: AppInputTheme.withIcon(hint: 'Vibrex', icon: null),
            ),
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
