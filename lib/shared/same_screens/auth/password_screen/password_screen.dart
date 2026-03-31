import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/components/button/bullet_text.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/core/themes/app_text_theme.dart';

import '../../../../core/size_config/size_config.dart';
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
                  'Create Your Password',
                  style: AppTextTheme.h1.copyWith(fontSize: 30, height: 1.4),
                ),
              ),
              SizedBox(height: 25),
              TextFormField(
                decoration: AppInputTheme.withIcon(
                  hint: 'Password',
                  icon: Icons.lock,
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: AppInputTheme.withIcon(
                  hint: 'Confirm Password',
                  icon: Icons.lock,
                ),
              ),
              SizedBox(height: 30),
              BulletText(text: 'At least 8 characters'),
              BulletText(text: 'One uppercase letter'),
              BulletText(text: 'One number'),
              BulletText(text: 'One symbol'),
              SizedBox(height: 20),
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
                  context.go(UserRoutesConstants.userHome);
                },
              ),
              SizedBox(height: 20),
              Text(
                'Your password is encrypted and kept secure. Your password is encrypted and kept secure.',
                style: AppTextTheme.paragraph.copyWith(height: 1.7),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
