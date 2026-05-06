import 'package:mobile/routes/auth/auth_service.dart';
import 'package:mobile/routes/auth/route_access.dart';
import 'package:mobile/routes/auth/route_helper.dart';
import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';

class RouteGuard {
  static String? redirect(String currentPath) {
    final isLoggedIn = AuthService.isLoggedIn;
    final role = AuthService.role;

    print(
      "RouteGuard: isLoggedIn=$isLoggedIn, role=$role, currentPath=$currentPath",
    );

    final publicRoutes = [
      SharedRoutesConstant.loginScreen,
      SharedRoutesConstant.signupScreen,
      SharedRoutesConstant.splashScreen,
      SharedRoutesConstant.otpScreen,
      SharedRoutesConstant.emailScreen,
      SharedRoutesConstant.passwordScreen,
      SharedRoutesConstant.accountTypeScreen,
    ];

    if (!isLoggedIn) {
      return publicRoutes.contains(currentPath)
          ? null
          : SharedRoutesConstant.accountTypeScreen;
    }

    if (isLoggedIn && publicRoutes.contains(currentPath)) {
      return getHomeRoute(role!);
    }

    if (!RouteAccess.canAccess(role!, currentPath)) {
      return SharedRoutesConstant.errorScreen;
    }

    return null;
  }
}
