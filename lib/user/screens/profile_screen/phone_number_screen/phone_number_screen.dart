import 'package:flutter/material.dart';
import 'package:mobile/core/size_config/size_config.dart';
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
        title: TopBarIconWithCenterText(pageName: 'Phone'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockWidth * 4.0,
          ),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.blockHeight * 9),

              SizedBox(
                width: SizeConfig.blockWidth * 50,
                child: Text('Phone Number', style: AppTextTheme.h1),
              ),
              SizedBox(height: 25),
              TextFormField(
                decoration: AppInputTheme.withIcon(
                  hint: 'Phone',
                  icon: Icons.phone,
                ),
              ),

              SizedBox(height: 25),
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
