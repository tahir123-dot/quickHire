import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mobile/components/setting/list_widget.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';

import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/core/themes/colors.dart';

import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final List<ListItemModel> businessInfoList = [
    ListItemModel(
      title: "Business details",
      route: SharedRoutesConstant.notificationScreen,
    ),
    ListItemModel(
      title: "Cover Image",
      route: SharedRoutesConstant.notificationScreen,
    ),
    ListItemModel(
      title: "Payment",
      route: SharedRoutesConstant.notificationScreen,
    ),
  ];

  final List<ListItemModel> businessSetupList = [
    ListItemModel(
      title: "Team",
      route: SharedRoutesConstant.notificationScreen,
    ),
    ListItemModel(
      title: "Services",
      route: SharedRoutesConstant.notificationScreen,
    ),
    ListItemModel(
      title: "Schedule",
      route: SharedRoutesConstant.notificationScreen,
    ),
    ListItemModel(
      title: "Location",
      route: SharedRoutesConstant.notificationScreen,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: Colors.transparent,
        elevation: 3, // 👈 yahan se shadow ayega
        shadowColor: Colors.black.withOpacity(0.2), //
        title: TopBarIconWithCenterText(pageName: 'Account Setup'),
      ),
      body: SafeArea(
        child: Scrollbar(
          thumbVisibility: true,
          thickness: 5,
          radius: Radius.circular(8),

          trackVisibility: true, //
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 43.w),
            children: [
              SizedBox(height: 53.h),
              Text('Business details', style: AppTextTheme.h1),
              SizedBox(height: 17.h),
              Text(
                'Add your business info, services, and schedule to get started',
              ),

              SizedBox(height: 45.h),
              Text(
                'Business Info',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16.h),

              ListWidget(items: businessInfoList),

              SizedBox(height: 45.h),
              Text(
                'Business Setup',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16.h),

              ListWidget(items: businessSetupList),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
