import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';

import '../../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../../core/size_config/size_config.dart';
import '../../../../core/themes/app_text_theme.dart';
import '../../../../core/themes/colors.dart';

class AddTeamMemberScreen extends StatefulWidget {
  const AddTeamMemberScreen({super.key});

  @override
  State<AddTeamMemberScreen> createState() => _AddTeamMemberScreenState();
}

class _AddTeamMemberScreenState extends State<AddTeamMemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarIconWithCenterText(pageName: 'Add Members'),
      ),
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
                child: Text('Team Members', style: AppTextTheme.h1),
              ),
              SizedBox(height: 15),
              Text(
                "They work under your shop and bookings will be managed by the shop.",
                style: AppTextTheme.paragraph,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 24),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/user.png"),
              ),
              SizedBox(height: 24),
              Text('Name'),
              TextFormField(
                decoration: AppInputTheme.withIcon(
                  hint: 'Full Name',
                  icon: Icons.person_rounded,
                ),
              ),
              SizedBox(height: 25),
              AppButtonTheme.iconTextButton(
                text: 'Add',
                icon: null,
                backgroundColor: AppColors.blackColor,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  print('move to next selectProfessional Screen');
                  context.push(ProviderRoutesConstants.selectProfessional);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
