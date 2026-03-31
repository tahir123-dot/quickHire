import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/export_screen/screen_exports.dart';
import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';


class SharedRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: SharedRoutesConstant.splashScreen,
      name: '/',
      pageBuilder: (context, state) {
        return MaterialPage(child: SplashScreen());
      },
    ),
    GoRoute(
      path: SharedRoutesConstant.addressScreen,
      name: 'addressScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: AddressScreen());
      },
    ),
    GoRoute(
      path: SharedRoutesConstant.accountTypeScreen,
      name: 'accountTypeScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: AccountTypeScreen());
      },
    ),
    GoRoute(
      path: SharedRoutesConstant.serviceCategoryScreen,
      name: 'serviceCategoryScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: ServicesCategoryScreen());
      },
    ),

    GoRoute(
      path: SharedRoutesConstant.emailScreen,
      name: 'emailScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: EmailScreen());
      },
    ),
    GoRoute(
      path: SharedRoutesConstant.loginScreen,
      name: 'loginScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: LoginScreen());
      },
    ),
    GoRoute(
      path: SharedRoutesConstant.otpScreen,
      name: 'otpScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: OtpScreen());
      },
    ),
    GoRoute(
      path: SharedRoutesConstant.passwordScreen,
      name: 'passwordScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: PasswordScreen());
      },
    ),GoRoute(
      path: SharedRoutesConstant.signupScreen,
      name: 'signupScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: SignupScreen());
      },
    ),
    GoRoute(
      path: SharedRoutesConstant.errorScreen,
      name: 'errorScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: ErrorScreen());
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
    ),GoRoute(
      path: SharedRoutesConstant.inviteFriendScreen,
      name: 'inviteFriendScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: InviteFriendsScreen());
      },
    ),GoRoute(
      path: SharedRoutesConstant.languageScreen,
      name: 'languageScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: LanguageScreen());
      },
    ),GoRoute(
      path: SharedRoutesConstant.notificationScreen,
      name: 'notificationScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: NotificationScreen());
      },
    ),GoRoute(
      path: SharedRoutesConstant.privacyPolicyScreen,
      name: 'privacyPolicyScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: PrivacyPolicyScreen());
      },
    ),GoRoute(
      path: SharedRoutesConstant.termsConditionScreen,
      name: 'termsConditionScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: TermsConditionScreen());
      },
    ),









  ];
}
