import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:mobile/core/navigation/circle_button.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';

import 'package:mobile/shared/bloc/blocimpl/authbloc.dart';
import 'package:mobile/shared/bloc/event/auth_event.dart';
import 'package:mobile/shared/bloc/state/auth_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? role;

  @override
  void initState() {
    super.initState();

    // 🔥 check role AFTER first frame check role here if role is then move next
    /*WidgetsBinding.instance.addPostFrameCallback((_) {
      final role = context.read<RoleCubit>().state;

      if (role == null) {
        context.go(SharedRoutesConstant.accountTypeScreen);
      }
    });*/
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        //  Loading
        if (state is AuthLoading) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Signing up...")));
        }

        //  Success
        if (state is SignupSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));

          context.go(SharedRoutesConstant.otpScreen);
        }

        // Error
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },

      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return Scaffold(
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 33.w),
                  children: [
                    SizedBox(height: 113.h),

                    Text('Create an\naccount', style: AppTextTheme.h1),

                    SizedBox(height: 19.h),

                    //  NAME
                    TextFormField(
                      controller: nameController,
                      decoration: AppInputTheme.withIcon(
                        hint: 'User Name',
                        icon: Icons.person_2,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name is required";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 19.h),

                    // 🟢 EMAIL
                    TextFormField(
                      controller: emailController,
                      decoration: AppInputTheme.withIcon(
                        hint: 'User Email',
                        icon: Icons.email,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }

                        final emailRegex = RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$",
                        );

                        if (!emailRegex.hasMatch(value)) {
                          return "Enter valid email";
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: 19.h),

                    // 🟢 PASSWORD
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: AppInputTheme.withIcon(
                        hint: 'Enter password',
                        icon: Icons.lock,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        }

                        if (value.length < 6) {
                          return "Min 6 characters required";
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: 19.h),

                    Text(
                      'We’ll send a verification code to your email so you can continue setting up your new account.',
                      style: AppTextTheme.paragraph,
                    ),

                    SizedBox(height: 19.h),

                    // SEND OTP BUTTON
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Send OTP', style: AppTextTheme.otpVerifyTheme),

                        CircleButton(
                          icon: Icons.arrow_forward,
                          onTap: isLoading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AuthBloc>().add(
                                      SignupEvent(
                                        nameController.text,
                                        emailController.text,
                                        passwordController.text,
                                        role!,
                                      ),
                                    );
                                  }
                                },
                        ),
                      ],
                    ),

                    SizedBox(height: 45.h),

                    // Google Button
                    AppButtonTheme.iconTextButton(
                      text: 'Continue With Google',
                      icon: Icons.g_mobiledata,
                      iconSize: 40.sp,
                      gap: 10,
                      backgroundColor: AppColors.transparentBackground,
                      overlay: AppColors.greyColor,
                      opacity: 1.0,
                      elevation: 0,
                      textColor: AppColors.blackColor,
                      onPressed: () {},
                    ),

                    SizedBox(height: 19.h),

                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.h),
                          child: Text('or continue with'),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),

                    SizedBox(height: 19.h),

                    // Login Button
                    AppButtonTheme.iconTextButton(
                      text: 'Login With Email',
                      icon: Icons.email,
                      iconColor: AppColors.whiteColor,
                      iconSize: 30.sp,
                      gap: 30,
                      backgroundColor: AppColors.blackColor,
                      elevation: 1,
                      textColor: AppColors.whiteColor,
                      onPressed: () {
                        context.push(SharedRoutesConstant.loginScreen);
                      },
                    ),

                    SizedBox(height: 41.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
