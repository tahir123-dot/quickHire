import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

import '../../../core/themes/colors.dart';

class UserCalenderScreen extends StatefulWidget {
  const UserCalenderScreen({super.key});

  @override
  State<UserCalenderScreen> createState() => _UserCalenderScreenState();
}

class _UserCalenderScreenState extends State<UserCalenderScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: const TopBarIconWithCenterText(pageName: 'Date and Time'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 16.w, // was blockWidth * 4
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Availablity screen',
                style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 12.h),

              AppButtonTheme.iconTextButton(
                text: 'Continue',
                icon: null,
                backgroundColor: AppColors.blueColor,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  context.push(UserRoutesConstants.userBookingDetail);
                },
              ),

              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
