import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/export_screen/screen_exports.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

class UserRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: UserRoutesConstants.userMainScreen,
      name: 'userMainScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: UserMainScreen());
      },
    ),
    GoRoute(
      path: UserRoutesConstants.userHome,
      name: 'userHome',
      pageBuilder: (context, state) {
        return MaterialPage(child: HomeScreen());
      },
    ),
    GoRoute(
      path: UserRoutesConstants.userBooking,
      name: 'userBooking',
      pageBuilder: (context, state) {
        return MaterialPage(child: BookingScreen());
      },
    ),
    GoRoute(
      path: UserRoutesConstants.userBookingDetail,
      name: 'userBookingDetail',
      pageBuilder: (context, state) {
        return MaterialPage(child: BookingDetailScreen());
      },
    ),
    GoRoute(
      path: UserRoutesConstants.userChat,
      name: 'userChat',
      pageBuilder: (context, state) {
        return MaterialPage(child: ChatScreen());
      },
    ),
    GoRoute(
      path: UserRoutesConstants.userProfile,
      name: 'userProfile',
      pageBuilder: (context, state) {
        return MaterialPage(child: ProfileScreen());
      },
    ),
    GoRoute(
      path: UserRoutesConstants.userPhone,
      name: 'userPhone',
      pageBuilder: (context, state) {
        return MaterialPage(child: PhoneNumberScreen());
      },
    ),
    GoRoute(
      path: UserRoutesConstants.userServiceProvider,
      name: 'userServiceProvider',
      pageBuilder: (context, state) {
        return MaterialPage(child: ProfileViewScreen());
      },
    ),
    GoRoute(
      path: UserRoutesConstants.userCalenderScreen,
      name: 'userCalenderScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: UserCalenderScreen());
      },
    ),
    GoRoute(
      path: UserRoutesConstants.userPayment,
      name: 'userPayment',
      pageBuilder: (context, state) {
        return MaterialPage(child: UserPayment());
      },
    ),
  ];
}
