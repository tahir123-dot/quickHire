import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';

import '../../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../../core/themes/app_text_theme.dart';
import '../../../../core/themes/colors.dart';

class AddTeamMemberScreen extends StatefulWidget {
  const AddTeamMemberScreen({super.key});

  @override
  State<AddTeamMemberScreen> createState() => _AddTeamMemberScreenState();
}

class _AddTeamMemberScreenState extends State<AddTeamMemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarIconWithCenterText(pageName: 'Add Members'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 42.h),

              Text('Team Members', style: AppTextTheme.h1),

              SizedBox(height: 15.h),

              Text(
                "They work under your shop and bookings will be managed by the shop.",
              ),

              SizedBox(height: 24.h),

              Text('Name', style: TextStyle(fontSize: 14.sp)),
              SizedBox(height: 6.h),
              TextFormField(
                decoration: AppInputTheme.withIcon(
                  hint: 'Enter Email',
                  icon: Icons.email,
                ),
              ),

              SizedBox(height: 350.h),

              AppButtonTheme.iconTextButton(
                text: 'Send Invite',
                icon: null,
                backgroundColor: AppColors.blackColor,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  print('Invite send successfully');
                },
              ),
              SizedBox(height: 35.h),
              AppButtonTheme.iconTextButton(
                text: 'View Team ',
                icon: null,
                backgroundColor: AppColors.whiteColor,
                textColor: AppColors.blackColor,
                onPressed: () {
                  print('move to next selectProfessional Screen');
                  context.push(ProviderRoutesConstants.teamList);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
