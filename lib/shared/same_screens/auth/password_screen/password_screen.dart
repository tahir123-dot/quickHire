import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/components/button/bullet_text.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/core/themes/colors.dart';
import '../../../../routes/user_routes/user_routes_constants.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 33.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 113.h),
              Text('Create Your\n Password', style: AppTextTheme.h1),

              SizedBox(height: 25.h),
              TextFormField(
                decoration: AppInputTheme.withIcon(
                  hint: 'Password',
                  icon: Icons.lock,
                ),
              ),
              SizedBox(height: 19.h),
              TextFormField(
                decoration: AppInputTheme.withIcon(
                  hint: 'Confirm Password',
                  icon: Icons.lock,
                ),
              ),
              SizedBox(height: 45.h),
              BulletText(text: 'At least 8 characters'),
              BulletText(text: 'One uppercase letter'),
              BulletText(text: 'One number'),
              BulletText(text: 'One symbol'),
              SizedBox(height: 53.h),
              AppButtonTheme.iconTextButton(
                text: 'Continue',
                icon: null,
                iconColor: AppColors.whiteColor,
                iconSize: 30,
                gap: 30,
                backgroundColor: AppColors.blackColor,
                elevation: 1,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  //context.go(UserRoutesConstants.userMainScreen);
                },
              ),
              SizedBox(height: 30.h),
              Center(
                child: Text(
                  'Your password is encrypted\n and kept secure.',
                  style: AppTextTheme.paragraph,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
