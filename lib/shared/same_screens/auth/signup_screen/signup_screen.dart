import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/navigation/circle_button.dart';
import 'package:mobile/core/size_config/size_config.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockWidth * 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.blockHeight * 9),

              SizedBox(
                width: SizeConfig.blockWidth * 50,
                child: Text(
                  'Create an account',
                  style: AppTextTheme.h1,
                ),
              ),
              SizedBox(height: 25),
              TextFormField(
                decoration: AppInputTheme.withIcon(
                  hint: 'User Name ',
                  icon: Icons.person_2,
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: AppInputTheme.withIcon(
                  hint: 'User Email',
                  icon: Icons.email,
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: AppInputTheme.withIcon(
                  hint: 'enter password',
                  icon: Icons.lock,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'We’ll send a verification code to your email so you can continue setting up your new account.',
                style: AppTextTheme.paragraph,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Send OTP',
                    style: AppTextTheme.otpVerifyTheme,
                  ),
                  CircleButton(
                    icon: Icons.arrow_forward,
                    route: SharedRoutesConstant.otpScreen,
                  ),
                ],
              ),
              SizedBox(height: 30),
              AppButtonTheme.iconTextButton(
                text: 'Continue With Google',
                icon: Icons.g_mobiledata,
                iconSize: 40,
                gap: 10,
                backgroundColor: AppColors.transparentBackground,
                overlay: AppColors.greyColor,
                opacity: 1.0,
                elevation: 0,
                textColor: AppColors.blackColor,
                onPressed: () {
                  print('click on Google');
                },
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  // Left horizontal line
                  Expanded(
                    child: Divider(
                      color: AppColors.greyColor, // line color
                      thickness: 1, // line thickness
                    ),
                  ),

                  // Text in the center
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'or continue with',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Right horizontal line
                  Expanded(child: Divider(color: AppColors.greyColor, thickness: 1)),
                ],
              ),
              SizedBox(height: 15),
              AppButtonTheme.iconTextButton(
                text: 'Login With Email',
                icon: Icons.email,
                iconColor: AppColors.whiteColor,
                iconSize: 30,
                gap: 30,
                backgroundColor: AppColors.blackColor,
                elevation: 1,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  context.push(SharedRoutesConstant.loginScreen);
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
