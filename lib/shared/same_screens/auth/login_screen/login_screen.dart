import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/navigation/circle_button.dart';
import 'package:mobile/core/size_config/size_config.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';
import '../../../../core/themes/app_button_theme.dart';
import '../../../../core/themes/colors.dart';
import '../../../../routes/shared_routes/shared_routes_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              CircleButton(icon: Icons.arrow_back,route: SharedRoutesConstant.signupScreen),
              SizedBox(height: SizeConfig.blockHeight * 9),

              SizedBox(
                width: SizeConfig.blockWidth * 65,
                child: Text(
                  'Login in to your account',
                  style: AppTextTheme.h1,
                ),
              ),
              SizedBox(height: 25),
              TextFormField(
                decoration: AppInputTheme.withIcon(
                  hint: 'Email',
                  icon: Icons.email,
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: AppInputTheme.withIcon(
                  hint: 'Password',
                  icon: Icons.lock,
                ),
              ),
              SizedBox(height: 0),
              TextButton(
                onPressed: () {
                  context.go(SharedRoutesConstant.emailScreen);
                },
                child: Text(
                  ' Forgot Password',
                  style: TextStyle(
                    color: AppColors.blueColor,
                    fontSize: SizeConfig.blockWidth * 4.0,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 50),
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
                  context.go(UserRoutesConstants.userHome);
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
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
