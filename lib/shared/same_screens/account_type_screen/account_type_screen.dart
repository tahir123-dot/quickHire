import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/components/category/category.dart';
import 'package:mobile/core/size_config/size_config.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';
import '../../../routes/shared_routes/shared_routes_constant.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.blockHeight * 9),
              SizedBox(
                width: SizeConfig.blockWidth * 90,
                child: Text(
                  'How You Want to Use QuickHire',
                  style: AppTextTheme.h1.copyWith(fontSize: 30, height: 1.4),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Category(
                title: "Book Local Services",
                description:
                    "Find Plumber, Electrician, Barber, Painter, AC Repair, etc.",
                image: "assets/images/book.png",
                borderColor: Colors.black,
                backgroundColor: Colors.white,
                onTap: () {
                  context.go(UserRoutesConstants.userHome);
                },
              ),
              SizedBox(height: 20),
              Category(
                title: "Provide Services",
                description: "Earn money by offering your skills locally.",
                image: "assets/images/provider.png",
                borderColor: Colors.black,
                backgroundColor: Colors.white,
                onTap: () {
                  context.go(SharedRoutesConstant.serviceCategoryScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
