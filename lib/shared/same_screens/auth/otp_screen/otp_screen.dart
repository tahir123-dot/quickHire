import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/core/navigation/circle_button.dart';
import 'package:mobile/core/size_config/size_config.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/shared/bloc/blocimpl/authbloc.dart';
import 'package:mobile/shared/bloc/event/auth_event.dart';
import 'package:mobile/shared/bloc/state/auth_state.dart';
import 'package:mobile/utils/storage.dart';
import '../../../../core/themes/app_text_theme.dart';
import '../../../../core/themes/colors.dart';
import '../../../../routes/shared_routes/shared_routes_constant.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isLoading = false;
  String? email;

  @override
  void initState() {
    super.initState();
    loadEmail(); // 🔥 yahan call karo
  }

  // load email from storage
  Future<void> loadEmail() async {
    final storage = getIt<IStorageService>();
    email = await storage.getEmail();
    setState(() {});
  }

  // Create a list of TextEditingControllers for each OTP field
  final List<TextEditingController> otpControllers = List.generate(
    5,
    (_) => TextEditingController(),
  );

  // Join the OTP values into a single string
  String getOtp() {
    return otpControllers.map((controller) => controller.text).join();
  }

  // Check all OTP fields are filled
  bool isOtpComplete() {
    return otpControllers.every((controller) => controller.text.isNotEmpty);
  }

  @override
  void dispose() {
    for (var c in otpControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          setState(() => isLoading = true);
        } else {
          setState(() => isLoading = false);
        }

        if (state is ResendOtpSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }

        if (state is OtpVerifySuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          context.go(SharedRoutesConstant.accountTypeScreen);
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
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
                  child: Text('Verify OTP', style: AppTextTheme.h1),
                ),
                SizedBox(height: 25),
                Text(
                  'We sent an OTP to $email Enter it below to continue.',
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
                        controller: otpControllers[index],
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
                    style: AppTextTheme.paragraph.copyWith(
                      color: AppColors.blackColor,
                    ),
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
                            if (email == null || email!.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Email not loaded yet")),
                              );
                              return;
                            }
                            context.read<AuthBloc>().add(
                              ResendOtpEvent(email!),
                            );
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Verify', style: AppTextTheme.otpVerifyTheme),
                    CircleButton(
                      icon: Icons.arrow_forward,
                      onTap: isLoading
                          ? null
                          : () {
                              if (!isOtpComplete()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Please enter complete OTP"),
                                  ),
                                );
                                return;
                              }

                              final otp = getOtp();

                              if (email == null || email!.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Email not loaded yet"),
                                  ),
                                );
                                return;
                              }

                              context.read<AuthBloc>().add(
                                OtpVerificationEvent(email!, otp),
                              );
                            },
                    ),
                  ],
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
