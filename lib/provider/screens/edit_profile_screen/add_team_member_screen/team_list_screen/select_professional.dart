import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

import '../../../../../components/team_card/team_card.dart';
import '../../../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../../../core/themes/colors.dart';

// this side use by user

class SelectProfessional extends StatelessWidget {
  const SelectProfessional({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarIconWithCenterText(pageName: 'SelectProfessional'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 42.h),

              Text('Select Professional', style: AppTextTheme.h1),
              SizedBox(height: 10.h),

              Text(
                "Customers can select them for bookings, but all payments and bookings stay with the shop.",
              ),

              SizedBox(height: 60.h),

              TeamCard(actionText: "Select", isSelectable: true),
              SizedBox(height: 28.h),

              TeamCard(actionText: "Select", isSelectable: true),
              SizedBox(height: 28.h),

              TeamCard(actionText: "Select", isSelectable: true),
              SizedBox(height: 28.h),

              TeamCard(actionText: "Select", isSelectable: true),
              SizedBox(height: 28.h),

              AppButtonTheme.iconTextButton(
                text: 'Continue',
                icon: null,
                backgroundColor: AppColors.blackColor,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  context.push(UserRoutesConstants.userCalenderScreen);
                },
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
