import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/navigation/circle_button.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/core/themes/colors.dart';
import '../../../../core/themes/app_button_theme.dart';
import '../../../../core/themes/app_text_theme.dart';
import '../../../../routes/shared_routes/shared_routes_constant.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 70.w, // 👈 important
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: CircleButton(
            icon: Icons.arrow_back,
            route: SharedRoutesConstant.loginScreen,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 33.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 113.h),

              Text('Enter your\n Email', style: AppTextTheme.h1),

              SizedBox(height: 25.h),
              TextFormField(
                decoration: AppInputTheme.withIcon(
                  hint: 'Email',
                  icon: Icons.email,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'We’ll send a verification code to your email so you can continue setting up your new account.',
                style: AppTextTheme.paragraph,
                textAlign: TextAlign.start,
              ),

              SizedBox(height: 79.h),
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
                  context.push(
                    SharedRoutesConstant.passwordScreen,
                  ); // in this we also check first email to sent otp and then go to otp screen then password screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
