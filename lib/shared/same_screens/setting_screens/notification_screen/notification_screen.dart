import 'package:flutter/material.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/size_config/size_config.dart';

import '../../../../core/themes/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarIconWithCenterText(pageName: 'Notification'),
      ),
      body: SafeArea(
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            top: 20,
            left: SizeConfig.blockWidth * 4,
            right: SizeConfig.blockWidth * 4,
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/user.png"),
              ),
              title: Text('Tahir Rashid'),
              subtitle: Text("Notification message"),
              trailing: Text("Just Now"),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
              thickness: 1,
              color: AppColors.horizontalLine,
            );
          },
        ),
      ),
    );
  }
}
