import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/shared/same_screens/setting_screens/setting/listwidget.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/routes/shared_routes/public_routes_constants.dart';
import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';
import 'package:mobile/shared/bloc/blocimpl/authbloc.dart';
import 'package:mobile/shared/bloc/event/auth_event.dart';
import 'package:mobile/shared/bloc/state/auth_state.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // Sab lists 100% pure DATA hain - koi onTap closure, koi context nahi.
  final List<ListItemModel> settingsListOne = [
    ListItemModel(
      id: 'notifications',
      title: "Notifications",
      route: SharedRoutesConstant.notificationScreen,
    ),
    ListItemModel(
      id: 'language',
      title: "Language",
      route: SharedRoutesConstant.languageScreen,
    ),
    ListItemModel(
      id: 'app_version',
      title: "App Version",
      route: SharedRoutesConstant.appVersionScreen,
    ),
  ];

  final List<ListItemModel> settingListTwo = [
    ListItemModel(
      id: 'terms_conditions',
      title: "Terms & Conditions",
      route: SharedRoutesConstant.termsConditionScreen,
    ),
  ];

  final List<ListItemModel> settingListThree = [
    ListItemModel(
      id: 'invite_friends',
      title: "Invite friends",
      route: SharedRoutesConstant.inviteFriendScreen,
    ),
    ListItemModel(id: 'switch_account', title: "Switch account"),
    ListItemModel(id: 'logout', title: "Logout"),
  ];

  void _handleItemTap(BuildContext context, ListItemModel item) {
    switch (item.id) {
      case 'logout':
        context.read<AuthBloc>().add(LogoutEvent());
        break;

      case 'switch_account':
        print("Switch account clicked");
        break;

      default:
        if (item.route != null) {
          context.push(item.route!);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.transparentBackground,
        title: const Text('Setting'),
      ),
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LogoutSuccess) {
              context.go(PublicRoutesConstants.loginScreen);
            }
          },
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
                  ListWidget(
                    items: settingsListOne,
                    onItemTap: (item) => _handleItemTap(context, item),
                  ),

                  SizedBox(height: 18.h),

                  Text('Legal', style: TextStyle(fontSize: 19.sp)),
                  SizedBox(height: 16.h),
                  ListWidget(
                    items: settingListTwo,
                    onItemTap: (item) => _handleItemTap(context, item),
                  ),

                  SizedBox(height: 18.h),

                  Text('Account Control', style: TextStyle(fontSize: 19.sp)),
                  SizedBox(height: 16.h),
                  ListWidget(
                    items: settingListThree,
                    onItemTap: (item) => _handleItemTap(context, item),
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
