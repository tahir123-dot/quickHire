import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/export_screen/screen_exports.dart';
import 'package:mobile/routes/shared_routes/public_routes_constants.dart';

class PublicRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: PublicRoutesConstants.splashScreen,
      name: '/',
      pageBuilder: (context, state) {
        return MaterialPage(child: SplashScreen());
      },
    ),
    GoRoute(
      path: PublicRoutesConstants.accountTypeScreen,
      name: 'accountTypeScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: AccountTypeScreen());
      },
    ),
    GoRoute(
      path: PublicRoutesConstants.emailScreen,
      name: 'emailScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: EmailScreen());
      },
    ),
    GoRoute(
      path: PublicRoutesConstants.loginScreen,
      name: 'loginScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: LoginScreen());
      },
    ),
    GoRoute(
      path: PublicRoutesConstants.otpScreen,
      name: 'otpScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: OtpScreen());
      },
    ),
    GoRoute(
      path: PublicRoutesConstants.passwordScreen,
      name: 'passwordScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: PasswordScreen());
      },
    ),
    GoRoute(
      path: PublicRoutesConstants.signupScreen,
      name: 'signupScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: SignupScreen());
      },
    ),
    GoRoute(
      path: PublicRoutesConstants.errorScreen,
      name: 'errorScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: ErrorScreen());
      },
    ),
  ];
}
