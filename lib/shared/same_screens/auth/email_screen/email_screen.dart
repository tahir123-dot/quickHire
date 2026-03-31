import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/navigation/circle_button.dart';
import 'package:mobile/core/themes/app_input_theme.dart';

import '../../../../core/size_config/size_config.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockWidth * 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleButton(
                icon: Icons.arrow_back,
                route: SharedRoutesConstant.loginScreen,
              ),
              SizedBox(height: SizeConfig.blockHeight * 9),

              SizedBox(
                width: SizeConfig.blockWidth * 50,
                child: Text(
                  'Enter your Email',
                  style: AppTextTheme.h1.copyWith(fontSize: 30, height: 1.4),
                ),
              ),
              SizedBox(height: 25),
              TextFormField(
                decoration: AppInputTheme.withIcon(
                  hint: 'Email',
                  icon: Icons.email,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'We’ll send a verification code to your email so you can continue setting up your new account.',
                style: AppTextTheme.paragraph,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 15),
              SizedBox(height: 50),
              AppButtonTheme.iconTextButton(
                text: 'Continue',
                icon: null,
                iconColor: Colors.white,
                iconSize: 30,
                gap: 30,
                backgroundColor: Colors.black,
                elevation: 1,
                textColor: Colors.white,
                onPressed: () {
                  context.push(SharedRoutesConstant.passwordScreen);// in this we also check first email to sent otp and then go to otp screen then password screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
