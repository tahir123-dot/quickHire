import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/export_screen/screen_exports.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

class UserRoutes {
  static List<GoRoute> routes = [
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
        return MaterialPage(child: HomeScreen());
      },
    ),
    GoRoute(
      path: UserRoutesConstants.userBookingDetail,
      name: 'userBookingDetail',
      pageBuilder: (context, state) {
        return MaterialPage(child: HomeScreen());
      },
    ),
    GoRoute(
      path: UserRoutesConstants.userChat,
      name: 'userChat',
      pageBuilder: (context, state) {
        return MaterialPage(child: HomeScreen());
      },
    ),
    GoRoute(
      path: UserRoutesConstants.userProfile,
      name: 'userProfile',
      pageBuilder: (context, state) {
        return MaterialPage(child: HomeScreen());
      },
    ),
    GoRoute(
      path: UserRoutesConstants.userHistory,
      name: 'userHistory',
      pageBuilder: (context, state) {
        return MaterialPage(child: HomeScreen());
      },
    ),
    GoRoute(
      path: UserRoutesConstants.userReviews,
      name: 'userReviews',
      pageBuilder: (context, state) {
        return MaterialPage(child: HomeScreen());
      },
    ),
    GoRoute(
      path: UserRoutesConstants.userPhone,
      name: 'userPhone',
      pageBuilder: (context, state) {
        return MaterialPage(child: HomeScreen());
      },
    ),
    GoRoute(
      path: UserRoutesConstants.userServiceProvider,
      name: 'userServiceProvider',
      pageBuilder: (context, state) {
        return MaterialPage(child: HomeScreen());
      },
    ),
  ];
}
