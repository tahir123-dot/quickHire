import 'package:flutter/material.dart';
import 'package:mobile/components/setting/list_widget.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';
import '../../../../core/size_config/size_config.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List<Map<String, String>> settingsListOne = [
    {
      "title": "Notifications",
      "route": SharedRoutesConstant.notificationScreen,
    },
    {"title": "Language", "route": SharedRoutesConstant.languageScreen},
    {"title": "App Version", "route": SharedRoutesConstant.appVersionScreen},
  ];

  List<Map<String, String>> settingListTwo = [
    {
      "title": "Terms & Conditions",
      "route": SharedRoutesConstant.termsConditionScreen,
    },
  ];

  List<Map<String, String>> settingListThree = [
    {
      "title": "Invite friends",
      "route": SharedRoutesConstant.inviteFriendScreen,
    },
    {"title": "Switch account", "route": ""},
    {"title": "Logout", "route": ""},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockWidth * 4.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBarIconWithCenterText(pageName: 'Setting'),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockWidth * 1.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('App Preferences', style: TextStyle(fontSize: 19)),
                    SizedBox(height: 16),
                    ListWidget(items: settingsListOne),

                    SizedBox(height: 16),
                    //
                    Text('Legal', style: TextStyle(fontSize: 19)),
                    SizedBox(height: 16),

                    ListWidget(items: settingListTwo),
                    SizedBox(height: 16),
                    //
                    Text('Account Control', style: TextStyle(fontSize: 19)),
                    SizedBox(height: 16),
                    ListWidget(items: settingListThree),
                  ],
                ),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}
