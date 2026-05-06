import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/colors.dart';

import '../../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../../core/themes/app_input_theme.dart';
import '../../../../core/themes/app_text_theme.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: const TopBarIconWithCenterText(pageName: 'Phone'),
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
              SizedBox(height: 36.h), // was blockHeight * 9

              SizedBox(
                width: 200.w, // approx 50%
                child: Text('Phone Number', style: AppTextTheme.h1),
              ),

              SizedBox(height: 25.h),

              TextFormField(
                decoration: AppInputTheme.withIcon(
                  hint: 'Phone',
                  icon: Icons.phone,
                ),
              ),

              SizedBox(height: 25.h),

              AppButtonTheme.iconTextButton(
                text: 'Save',
                icon: null,
                backgroundColor: AppColors.blackColor,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  print("Phone number saved");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
