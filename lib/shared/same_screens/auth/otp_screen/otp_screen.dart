import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/navigation/circle_button.dart';
import 'package:mobile/core/size_config/size_config.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import '../../../../core/themes/app_text_theme.dart';
import '../../../../core/themes/colors.dart';
import '../../../../routes/shared_routes/shared_routes_constant.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
              SizedBox(height: SizeConfig.blockHeight * 15),
              SizedBox(
                width: SizeConfig.blockWidth * 50,
                child: Text(
                  'Verify OTP',
                  style: AppTextTheme.h1.copyWith(fontSize: 30, height: 1.4),
                ),
              ),
              SizedBox(height: 25),
              Text(
                'We sent an OTP to esther. howard@gmail.com Enter it below to continue.',
                style: AppTextTheme.paragraph,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (index) {
                  return SizedBox(
                    width: 50,
                    child: TextFormField(
                      decoration: AppInputTheme.forOTP(hint: '*'),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: TextStyle(fontSize: 18),
                      // optional: onChanged etc
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),

              // Resend OTP
              RichText(
                text: TextSpan(
                  text: 'Resend available: ',
                  style: AppTextTheme.paragraph.copyWith(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Resend OTP',
                      style: TextStyle(
                        color: AppColors.blueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockWidth * 4.0,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("resend otp code again");
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Verify',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                  CircleButton(
                    icon: Icons.arrow_forward,
                    route: SharedRoutesConstant.accountTypeScreen,
                  ),
                ],
              ),
              SizedBox(height: 25),
              AppButtonTheme.iconTextButton(
                text: 'Back',
                icon: Icons.arrow_back,
                iconColor: Colors.white,
                iconSize: 20,
                gap: 10,
                backgroundColor: Colors.black,
                elevation: 1,
                textColor: Colors.white,
                onPressed: () {
                  context.go(SharedRoutesConstant.emailScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
