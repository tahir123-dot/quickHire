import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/export_screen/screen_exports.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';

class ProviderRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: '/provider',
      builder: (context, state) => const SizedBox(),

      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ProviderMainScreen(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: ProviderRoutesConstants.dashboard, // "booking"
                  builder: (context, state) => DashboardScreen(),
                ),
              ],
            ),

            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: ProviderRoutesConstants.booking,
                  builder: (context, state) => ProviderBookingScreen(),
                ),
              ],
            ),

            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: ProviderRoutesConstants.boost, // "chat"
                  builder: (context, state) => BoostProfileScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: ProviderRoutesConstants.editProfile, // "chat"
                  builder: (context, state) => EditProfileScreen(),
                ),
              ],
            ),
          ],
        ),

        GoRoute(
          path: 'editProfile/businessDetails',
          builder: (context, state) => BusinessDetailsScreen(),
        ),

        GoRoute(
          path: 'editProfile/banner',
          builder: (context, state) => BusinessBannerScreen(),
        ),

        GoRoute(
          path: 'serviceCategoryScreen', // "chat"
          builder: (context, state) => ServicesCategoryScreen(),
        ),

        GoRoute(
          path: 'editProfile/payment',
          builder: (context, state) => ProviderPayment(),
        ),
        GoRoute(
          path: 'editProfile/customerReview',
          builder: (context, state) => CustomerReviewsScreen(),
        ),
        GoRoute(
          path: 'editProfile/addTeam',
          builder: (context, state) => AddTeamMemberScreen(),
          routes: [
            GoRoute(
              path: 'teamList',
              builder: (context, state) => TeamListScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'editProfile/addServiceScreen', // "chat"
          builder: (context, state) => AddServiceScreen(),
        ),
        GoRoute(
          path: 'editProfile/addAvailability', // "chat"
          builder: (context, state) => AddAvailabilityScreen(),
        ),
      ],
    ),

    GoRoute(
      path: ProviderRoutesConstants.providerCategory,
      name: 'providerCategory',
      pageBuilder: (context, state) {
        return MaterialPage(child: CategoryInfoScreen());
      },
    ),

    GoRoute(
      path: ProviderRoutesConstants.providerAddCampaign,
      name: 'providerAddCampaign',
      pageBuilder: (context, state) {
        return MaterialPage(child: AddCampaignScreen());
      },
    ),
    GoRoute(
      path: ProviderRoutesConstants.providerAdsPlan,
      name: 'providerAdsPlan',
      pageBuilder: (context, state) {
        return MaterialPage(child: AdsPlanScreen());
      },
    ),
  ];
}
