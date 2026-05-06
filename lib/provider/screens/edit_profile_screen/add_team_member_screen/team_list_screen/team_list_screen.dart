import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mobile/components/team_card/team_card.dart';
import 'package:mobile/core/themes/app_text_theme.dart';

import '../../../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../../../core/themes/colors.dart';

class TeamListScreen extends StatefulWidget {
  const TeamListScreen({super.key});

  @override
  State<TeamListScreen> createState() => _TeamListScreenState();
}

class _TeamListScreenState extends State<TeamListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarIconWithCenterText(pageName: 'Team'),
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

              Text('Team', style: AppTextTheme.h1),
              SizedBox(height: 10.h),

              Text(
                "Customers can select them for bookings, but all payments and bookings stay with the shop.",
              ),

              SizedBox(height: 60.h),

              TeamCard(actionText: "Delete"),
              SizedBox(height: 28.h),

              TeamCard(actionText: "Delete"),
              SizedBox(height: 28.h),

              TeamCard(actionText: "Delete"),
              SizedBox(height: 28.h),

              TeamCard(actionText: "Delete"),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
