import 'package:flutter/material.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

import '../../../components/setting/list_widget.dart';
import '../../../core/size_config/size_config.dart';
import '../../../routes/shared_routes/shared_routes_constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Map<String, String>> settingsListOne = [
    {"title": "Address", "route": SharedRoutesConstant.addressScreen},
    {"title": "Phone", "route": UserRoutesConstants.userPhone},
    {"title": "Change Password", "route": SharedRoutesConstant.passwordScreen},
  ];

  List<Map<String, String>> settingsListTwo = [
    {"title": "My Payments", "route": SharedRoutesConstant.appVersionScreen},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockWidth * 4.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.blockHeight * 6),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/images/user.png"),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Tahir Rashid",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text('Contact Info', style: TextStyle(fontSize: 19)),
              SizedBox(height: 16),
              ListWidget(items: settingsListOne),

              SizedBox(height: 16),
              Text('Activity', style: TextStyle(fontSize: 19)),
              SizedBox(height: 16),
              ListWidget(items: settingsListTwo),
            ],
          ),
        ),
      ),
    );
  }
}
