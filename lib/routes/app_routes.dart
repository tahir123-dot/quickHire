import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/auth/go_refresh_stream.dart';
import 'package:mobile/routes/auth/role_permission.dart';
import 'package:mobile/routes/professional_routes/professional_routes.dart';
import 'package:mobile/routes/provider_routes/provider_routes.dart';
import 'package:mobile/routes/shared_routes/public_routes.dart';
import 'package:mobile/routes/shared_routes/public_routes_constants.dart';
import 'package:mobile/routes/shared_routes/shared_routes.dart';
import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';
import 'package:mobile/routes/user_routes/user_routes.dart';
import 'package:mobile/shared/bloc/blocimpl/authbloc.dart';
import 'package:mobile/shared/bloc/state/auth_state.dart';

import 'package:mobile/shared/same_screens/error_screen/error_screen.dart';
import 'package:mobile/utils/home.route.dart';

class AppRoutes {
  final AuthBloc authBloc;

  AppRoutes({required this.authBloc});

  late final GoRouter router = GoRouter(
    initialLocation:
        //ProviderRoutesConstants.provider, //UserRoutesConstants.customer,
        PublicRoutesConstants.splashScreen,
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      final currentPath = state.matchedLocation;

      debugPrint(" Current Route: $currentPath");

      final authState = authBloc.state;

      final isPublicPath = PublicRoutesConstants.publicPaths.contains(
        currentPath,
      );

      final isSharedPath = SharedRoutesConstant.all.contains(currentPath);

      if (authState is AuthInitial) {
        return PublicRoutesConstants.splashScreen;
      }

      if (authState is Unauthenticated || authState is AuthError) {
        if (isPublicPath) return null;

        return PublicRoutesConstants.loginScreen;
      }

      if (authState is Authenticated) {
        final role = authState.role;

        // authenticated user public/auth screen pe jaane ki koshish kare -> home bhej do
        if (isPublicPath) {
          return getHomeRoute(role);
        }

        // shared screens sab authenticated roles ke liye allowed hain
        if (isSharedPath) {
          return null;
        }

        // role-check: kya ye path is role ka hai?
        if (!isPathAllowedForRole(role, currentPath)) {
          return getHomeRoute(role);
        }
      }

      return null;
    },

    routes: [
      ...PublicRoutes.routes,
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
