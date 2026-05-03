import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/navigation/circle_button.dart';
import 'package:mobile/core/size_config/size_config.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';
import 'package:mobile/shared/bloc/blocimpl/authbloc.dart';
import 'package:mobile/shared/bloc/event/auth_event.dart';
import 'package:mobile/shared/bloc/state/auth_state.dart';
import '../../../../core/themes/app_button_theme.dart';
import '../../../../core/themes/colors.dart';
import '../../../../routes/shared_routes/shared_routes_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Logging in...")));
        }

        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          context.go(UserRoutesConstants.userMainScreen);
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockWidth * 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleButton(
                  icon: Icons.arrow_back,
                  route: SharedRoutesConstant.signupScreen,
                ),

                SizedBox(height: SizeConfig.blockHeight * 9),

                SizedBox(
                  width: SizeConfig.blockWidth * 65,
                  child: Text(
                    'Login in to your account',
                    style: AppTextTheme.h1,
                  ),
                ),

                const SizedBox(height: 25),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: AppInputTheme.withIcon(
                          hint: 'Email',
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

                      const SizedBox(height: 15),

                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: AppInputTheme.withIcon(
                          hint: 'Password',
                          icon: Icons.lock,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return "Min 6 characters required";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

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
                  ),
                ),

                const SizedBox(height: 50),

                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    final isLoading = state is AuthLoading;

                    return AppButtonTheme.iconTextButton(
                      text: isLoading ? 'Loading...' : 'Continue',
                      icon: null,
                      iconColor: AppColors.whiteColor,
                      iconSize: 30,
                      gap: 30,
                      backgroundColor: AppColors.blackColor,
                      elevation: 1,
                      textColor: AppColors.whiteColor,
                      onPressed: isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                  LoginEvent(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                  ),
                                );
                              }
                            },
                    );
                  },
                ),

                const SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(
                      child: Divider(color: AppColors.greyColor, thickness: 1),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'or continue with',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: AppColors.greyColor, thickness: 1),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

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

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
