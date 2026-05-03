import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

import '../../../../../components/team_card/team_card.dart';
import '../../../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../../../core/size_config/size_config.dart';
import '../../../../../core/themes/colors.dart';

class SelectProfessional extends StatelessWidget {
  const SelectProfessional({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarIconWithCenterText(pageName: 'SelectProfessional'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(SizeConfig.blockWidth * 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.blockHeight * 3),

              SizedBox(height: 40),
              TeamCard(actionText: "Select", isSelectable: true),
              SizedBox(height: 20),
              TeamCard(actionText: "Select", isSelectable: true),
              SizedBox(height: 20),
              TeamCard(actionText: "Select", isSelectable: true),
              SizedBox(height: 20),
              TeamCard(actionText: "Select", isSelectable: true),
              SizedBox(height: 20),
              AppButtonTheme.iconTextButton(
                text: 'Continue',
                icon: null,
                backgroundColor: AppColors.blackColor,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  context.push(UserRoutesConstants.userCalenderScreen);
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
