import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/size_config/size_config.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

import '../../../components/availability_component/availability_component.dart';
import '../../../core/themes/colors.dart';

class UserCalenderScreen extends StatefulWidget {
  const UserCalenderScreen({super.key});

  @override
  State<UserCalenderScreen> createState() => _UserCalenderScreenState();
}

class _UserCalenderScreenState extends State<UserCalenderScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarIconWithCenterText(pageName: 'Date and Time'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockWidth * 4.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Availablity screen',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              AvailabilityComponent(
                focusedDay: today,
                onDaySelected: (selectedDay, focusedDay) {},
              ),

              SizedBox(height: 12),
              AppButtonTheme.iconTextButton(
                text: 'Continue',
                icon: null,
                backgroundColor: AppColors.blueColor,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  context.push(UserRoutesConstants.userBookingDetail);
                },
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
