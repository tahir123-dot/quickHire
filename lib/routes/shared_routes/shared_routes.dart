import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/export_screen/screen_exports.dart';
import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';
import 'package:mobile/shared/bloc/blocimpl/location_bloc.dart';
import 'package:mobile/shared/bloc/blocimpl/notification_bloc.dart';

class SharedRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: SharedRoutesConstant.addressScreen,
      name: 'addressScreen',
      pageBuilder: (context, state) {
        return MaterialPage(
          child: BlocProvider(
            create: (context) => getIt<LocationBloc>(),
            child: const AddressScreen(),
          ),
        );
      },
    ),
    GoRoute(
      path: SharedRoutesConstant.settingScreen,
      name: 'settingScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: Setting());
      },
    ),
    GoRoute(
      path: SharedRoutesConstant.appVersionScreen,
      name: 'appVersionScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: AppVersionScreen());
      },
    ),
    GoRoute(
      path: SharedRoutesConstant.inviteFriendScreen,
      name: 'inviteFriendScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: InviteFriendsScreen());
      },
    ),
    GoRoute(
      path: SharedRoutesConstant.languageScreen,
      name: 'languageScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: LanguageScreen());
      },
    ),
    GoRoute(
      path: SharedRoutesConstant.notificationScreen,
      name: 'notificationScreen',
      pageBuilder: (context, state) {
        return MaterialPage(
          child: BlocProvider(
            create: (context) => getIt<NotificationBloc>(),
            child: const NotificationScreen(),
          ),
        );
      },
    ),
    GoRoute(
      path: SharedRoutesConstant.termsConditionScreen,
      name: 'termsConditionScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: TermsConditionScreen());
      },
    ),
  ];
}
