import 'package:flutter/material.dart';
import 'package:mobile/components/team_card/team_card.dart';
import 'package:mobile/core/size_config/size_config.dart';
import 'package:mobile/core/themes/app_text_theme.dart';

import '../../../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../../../core/themes/colors.dart';

class TeamListScreen extends StatefulWidget {
  const TeamListScreen({super.key});

  @override
  State<TeamListScreen> createState() => _TeamListScreenState();
}

class _TeamListScreenState extends State<TeamListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarIconWithCenterText(pageName: 'Team'),
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
              SizedBox(
                width: SizeConfig.blockWidth * 50,
                child: Text('Team', style: AppTextTheme.h1),
              ),
              SizedBox(height: 15),
              Text(
                "Customers can select them for bookings, but all payments and bookings stay with the shop.",
                style: AppTextTheme.paragraph,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 40),
              TeamCard(actionText: "Delete"),
              SizedBox(height: 20),
              TeamCard(actionText: "Delete"),
              SizedBox(height: 20),
              TeamCard(actionText: "Delete"),
              SizedBox(height: 20),
              TeamCard(actionText: "Delete"),
            ],
          ),
        ),
      ),
    );
  }
}
