import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/auth/go_refresh_stream.dart';
import 'package:mobile/routes/auth/role_permission.dart';
import 'package:mobile/routes/professional_routes/professional_routes.dart';
import 'package:mobile/routes/provider_routes/provider_routes.dart';
import 'package:mobile/routes/shared_routes/public_routes.dart';
import 'package:mobile/routes/shared_routes/public_routes_constants.dart';
import 'package:mobile/routes/shared_routes/shared_routes.dart';
import 'package:mobile/routes/user_routes/user_routes.dart';
import 'package:mobile/shared/bloc/blocimpl/authbloc.dart';
import 'package:mobile/shared/bloc/state/auth_state.dart';
import 'package:mobile/shared/same_screens/error_screen/error_screen.dart';

class AppRoutes {
  final AuthBloc authBloc;

  AppRoutes({required this.authBloc});

  late final GoRouter router = GoRouter(
    initialLocation: PublicRoutesConstants.splashScreen,

    refreshListenable: GoRouterRefreshStream(authBloc.stream),

    redirect: (context, state) {
      final authState = authBloc.state;

      final isPublicRoute = PublicRoutesConstants.publicPaths.contains(
        state.matchedLocation,
      );

      // Not logged in
      if (authState is Unauthenticated) {
        return isPublicRoute ? null : PublicRoutesConstants.loginScreen;
      }

      //  Logged in
      if (authState is Authenticated) {
        final role = authState.role;
        final allowedRoutes = rolePermissions[role] ?? [];

        final currentRoute = state.matchedLocation;

        final isAllowed = allowedRoutes.any(
          (path) => currentRoute.startsWith(path),
        );

        if (!isAllowed) {
          return "/errorScreen";
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
