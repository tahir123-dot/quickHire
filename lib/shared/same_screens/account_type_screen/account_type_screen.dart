import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/components/category/category.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/routes/auth/role_enum.dart';
import 'package:mobile/routes/shared_routes/public_routes_constants.dart';
import 'package:mobile/shared/bloc/blocimpl/rolecubit.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 33.w),
          child: Column(
            children: [
              SizedBox(height: 146.h),

              Text(
                'How You Want to Use QuickHire',
                style: AppTextTheme.h1,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 64.h),

              // 🟢 USER
              Category(
                title: "Book Local Services",
                description:
                    "Find Plumber, Electrician, Barber, Painter, AC Repair, etc.",
                image: "assets/images/book.png",
                borderColor: AppColors.blackColor,
                backgroundColor: AppColors.whiteColor,
                onTap: () {
                  context.read<RoleCubit>().setRole(UserRole.customer);
                  context.go(PublicRoutesConstants.signupScreen);
                },
              ),

              SizedBox(height: 20.h),

              // 🔵 PROVIDER
              Category(
                title: "Provide Services",
                description: "Earn money by offering your skills locally.",
                image: "assets/images/provider.png",
                borderColor: AppColors.blackColor,
                backgroundColor: AppColors.whiteColor,
                onTap: () {
                  context.read<RoleCubit>().setRole(UserRole.serviceProvider);
                  context.go(PublicRoutesConstants.signupScreen);
                },
              ),

              SizedBox(height: 20.h),

              // 🟣 TEAM
              Category(
                title: "Join as a Professional",
                description:
                    "Work with a service provider as part of their team",
                image: "assets/images/professional.png",
                borderColor: AppColors.blackColor,
                backgroundColor: AppColors.whiteColor,
                onTap: () {
                  context.read<RoleCubit>().setRole(UserRole.member);
                  context.go(PublicRoutesConstants.signupScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
