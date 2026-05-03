import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/professional_routes/professional_routes.dart';
import 'package:mobile/routes/provider_routes/provider_routes.dart';
import 'package:mobile/routes/shared_routes/shared_routes.dart';
import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';
import 'package:mobile/routes/user_routes/user_routes.dart';
import 'package:mobile/shared/same_screens/error_screen/error_screen.dart';

class AppRoutes {
  GoRouter router = GoRouter(
    initialLocation: SharedRoutesConstant.splashScreen,

    redirect: (context, state) {
      return RouteGuard.redirect(state.uri.path);
    },
    routes: [
      ...SharedRoutes.routes,
      ...UserRoutes.routes,
      ...ProviderRoutes.routes,
      ...ProfessionalRoutes.routes,
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(child: ErrorScreen());
    },
  );
}
