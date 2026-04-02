import 'package:flutter/material.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';

import '../../../../core/size_config/size_config.dart';
import '../../../../core/themes/app_button_theme.dart';
import '../../../../core/themes/app_input_theme.dart';
import '../../../../core/themes/colors.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarIconWithCenterText(pageName: 'My Profile'),
      ),
      body: SafeArea(
        child: ListView(
            padding: EdgeInsets.all(SizeConfig.blockWidth * 4),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    'Add Services',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 26),

                  TextFormField(
                    decoration: AppInputTheme.withIcon(
                      hint: 'Service Category',
                      icon: Icons.arrow_drop_down_sharp,
                    ),
                  ),
                  SizedBox(height: 14),

                  TextFormField(
                    decoration: AppInputTheme.withIcon(
                      hint: 'Service Name',
                      icon: Icons.miscellaneous_services,
                    ),
                  ),
                  SizedBox(height: 14),

                  TextFormField(
                    decoration: AppInputTheme.withIcon(
                      hint: 'Rs 300.0',
                      icon: Icons.money,
                    ),
                  ),
                  SizedBox(height: 14),

                  TextFormField(
                    decoration: AppInputTheme.withIcon(
                      hint: '60 min',
                      icon: Icons.watch_later_outlined,
                    ),
                  ),
                  SizedBox(height: 14),

                  AppButtonTheme.iconTextButton(
                    text: 'Add',
                    icon: Icons.add_task,
                    backgroundColor: AppColors.blackColor,
                    textColor: AppColors.whiteColor,
                    onPressed: () {
                      print("Service added");
                    },
                  ),
                ],
              ),
            ],
          ),

      ),
    );
  }
}
