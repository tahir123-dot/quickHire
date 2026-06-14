import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/auth/go_refresh_stream.dart';
import 'package:mobile/routes/auth/role_permission.dart';
import 'package:mobile/routes/professional_routes/professional_routes.dart';
import 'package:mobile/routes/provider_routes/provider_routes.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';
import 'package:mobile/routes/shared_routes/public_routes.dart';
import 'package:mobile/routes/shared_routes/public_routes_constants.dart';
import 'package:mobile/routes/shared_routes/shared_routes.dart';
import 'package:mobile/routes/user_routes/user_routes.dart';
import 'package:mobile/shared/bloc/blocimpl/authbloc.dart';
import 'package:mobile/shared/bloc/state/auth_state.dart';

import 'package:mobile/shared/same_screens/error_screen/error_screen.dart';
import 'package:mobile/utils/home.route.dart';

class AppRoutes {
  final AuthBloc authBloc;

  AppRoutes({required this.authBloc});

  late final GoRouter router = GoRouter(
    initialLocation: ProviderRoutesConstants
        .serviceCategoryScreen, //PublicRoutesConstants.splashScreen,
    // refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      final path = state.matchedLocation;

      debugPrint(" Current Route: $path");

      /* final authState = authBloc.state;
      final currentPath = state.matchedLocation;

      final isPublicPath = PublicRoutesConstants.publicPaths.contains(
        currentPath,
      );

      if (authState is AuthLoading || authState is AuthInitial) {
        return PublicRoutesConstants.splashScreen;
      }

      if (authState is Unauthenticated || authState is AuthError) {
        if (isPublicPath) return null;

        return PublicRoutesConstants.loginScreen;
      }

      if (authState is Authenticated) {
        final role = authState.role;

        if (isPublicPath) {
          return getHomeRoute(role);
        }

        final allowedPrefixes = rolePermissions[role] ?? [];
        final isAllowed = allowedPrefixes.any(
          (prefix) =>
              currentPath.startsWith('/$prefix') ||
              currentPath.startsWith(prefix),
        );

        if (!isAllowed) {
          // Wrong role for this route — send them to their home
          return getHomeRoute(role);
        }
      }
      */
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
