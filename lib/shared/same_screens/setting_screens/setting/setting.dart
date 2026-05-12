import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/setting/list_widget.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';
import 'package:mobile/shared/bloc/blocimpl/authbloc.dart';
import 'package:mobile/shared/bloc/event/auth_event.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final List<ListItemModel> settingsListOne = [
    ListItemModel(
      title: "Notifications",
      route: SharedRoutesConstant.notificationScreen,
    ),
    ListItemModel(
      title: "Language",
      route: SharedRoutesConstant.languageScreen,
    ),
    ListItemModel(
      title: "App Version",
      route: SharedRoutesConstant.appVersionScreen,
    ),
  ];

  final List<ListItemModel> settingListTwo = [
    ListItemModel(
      title: "Terms & Conditions",
      route: SharedRoutesConstant.termsConditionScreen,
    ),
  ];

  final List<ListItemModel> settingListThree = [
    ListItemModel(
      title: "Invite friends",
      route: SharedRoutesConstant.inviteFriendScreen,
    ),
    ListItemModel(
      title: "Switch account",
      onTap: () {
        print("Switch account clicked");
      },
    ),
    ListItemModel(title: "Logout", onTap: null),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: TopBarIconWithCenterText(pageName: 'Setting'),
      ),
      body: SafeArea(
        child: BlocListener<AuthBloc, dynamic>(
          listener: (context, state) {},
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 43.w),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 43.h),

                  Text('App Preferences', style: TextStyle(fontSize: 19.sp)),
                  SizedBox(height: 16.h),
                  ListWidget(items: settingsListOne),

                  SizedBox(height: 18.h),

                  Text('Legal', style: TextStyle(fontSize: 19.sp)),
                  SizedBox(height: 16.h),
                  ListWidget(items: settingListTwo),

                  SizedBox(height: 18.h),

                  Text('Account Control', style: TextStyle(fontSize: 19.sp)),
                  SizedBox(height: 16.h),

                  // 🔥 Logout yahan handle karo (context safe)
                  ListWidget(
                    items: settingListThree.map((item) {
                      if (item.title == "Logout") {
                        return ListItemModel(
                          title: "Logout",
                          onTap: () {
                            print("Logout clicked");
                            //context.read<AuthBloc>().add(LogoutEvent());
                          },
                        );
                      }
                      return item;
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
