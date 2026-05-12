import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/setting/list_widget.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/routes/shared_routes/public_routes_constants.dart';
import '../../../routes/shared_routes/shared_routes_constant.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<ListItemModel> settingsListOne = [
    ListItemModel(title: "Address", route: SharedRoutesConstant.addressScreen),
    ListItemModel(title: "Phone", route: UserRoutesConstants.userPhone),
    ListItemModel(
      title: "Change Password",
      route: PublicRoutesConstants.passwordScreen,
    ),
  ];

  List<ListItemModel> settingsListTwo = [
    ListItemModel(
      title: "My Payments",
      route: SharedRoutesConstant.appVersionScreen,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TopBarIconWithCenterText(pageName: "Profile"),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 43.w),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 71.h),
                      CircleAvatar(
                        radius: 80.r,
                        backgroundImage: const AssetImage(
                          "assets/images/user.png",
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        "Tahir Rashid",
                        style: TextStyle(
                          fontSize: 27.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),

                Text('Contact Info', style: TextStyle(fontSize: 19.sp)),

                SizedBox(height: 16.h),

                ListWidget(items: settingsListOne),

                SizedBox(height: 16.h),

                Text('Activity', style: TextStyle(fontSize: 19.sp)),

                SizedBox(height: 16.h),

                ListWidget(items: settingsListTwo),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
