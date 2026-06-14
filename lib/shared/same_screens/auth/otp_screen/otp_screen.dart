import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/core/navigation/circle_button.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';
import 'package:mobile/shared/bloc/blocimpl/authbloc.dart';
import 'package:mobile/shared/bloc/event/auth_event.dart';
import 'package:mobile/shared/bloc/state/auth_state.dart';
import 'package:mobile/utils/flushbar_helper.dart';
import 'package:mobile/utils/storage.dart';
import '../../../../core/themes/app_text_theme.dart';
import '../../../../core/themes/colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isLoading = false;
  String? email;

  int _secondsLeft = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    loadEmail();
    _startTimer();
  }

  //  Timer start
  void _startTimer() {
    _secondsLeft = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsLeft--;
        });
      }
    });
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

  // FocusNodes — auto next field ke liye
  final List<FocusNode> focusNodes = List.generate(5, (_) => FocusNode());

  void onOtpChanged(String value, int index) {
    // Normal type — ek digit
    if (value.isNotEmpty && index < 4) {
      focusNodes[index + 1].requestFocus(); // next field pe jao
    }

    // Backspace — pichle field pe jao
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var c in otpControllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showFlushbar(
            context,
            message: "Sending OTP...",
            type: FlushbarType.info,
          );
        }
        if (state is OtpVerifySuccess) {
          showFlushbar(
            context,
            message: "Verification Successfully",
            type: FlushbarType.success,
          );
          context.push(ProviderRoutesConstants.serviceCategoryScreen);
        }
        if (state is AuthError) {
          showFlushbar(
            context,
            message: state.message,
            type: FlushbarType.error,
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
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

                  Text('Verify OTP', style: AppTextTheme.h1),

                  SizedBox(height: 15.h),
                  Text(
                    'We sent an OTP to $email Enter it below to continue.',
                    style: AppTextTheme.paragraph,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      return SizedBox(
                        width: 55.w,
                        height: 62.h,
                        child: TextFormField(
                          controller: otpControllers[index],
                          decoration: AppInputTheme.forOTP(hint: '*'),
                          focusNode: focusNodes[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: TextStyle(fontSize: 20.sp),
                          onChanged: (value) => onOtpChanged(value, index),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20.h),

                  // Resend OTP
                  if (_secondsLeft > 0)
                    Text(
                      'Resend available in $_secondsLeft sec',
                      style: AppTextTheme.paragraph.copyWith(
                        color: AppColors.blackColor,
                      ),
                    )
                  else
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
                              color: isLoading
                                  ? AppColors.greyColor
                                  : AppColors.blueColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                            recognizer: isLoading
                                ? null
                                : (TapGestureRecognizer()
                                    ..onTap = () {
                                      if (email == null || email!.isEmpty) {
                                        showFlushbar(
                                          context,
                                          message: "Email Not available",
                                          type: FlushbarType.error,
                                        );
                                        return;
                                      }

                                      context.read<AuthBloc>().add(
                                        ResendOtpEvent(email!),
                                      );
                                      _startTimer();
                                    }),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 349.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Verify', style: AppTextTheme.otpVerifyTheme),
                      CircleButton(
                        icon: Icons.arrow_forward,
                        onTap: isLoading
                            ? null
                            : () {
                                final otp = otpControllers
                                    .map((c) => c.text)
                                    .join();

                                if (otp.length < 5) {
                                  showFlushbar(
                                    context,
                                    message: 'Enter OTP',
                                    type: FlushbarType.info,
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
                  SizedBox(height: 25.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
