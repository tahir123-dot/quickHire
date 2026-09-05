import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/export_screen/screen_exports.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';

class ProviderRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: ProviderRoutesConstants.provider,
      redirect: (context, state) {
        if (state.fullPath == ProviderRoutesConstants.provider ||
            state.fullPath == '${ProviderRoutesConstants.provider}/') {
          return '${ProviderRoutesConstants.provider}/${ProviderRoutesConstants.dashboard}';
        }
        return null;
      },

      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ProviderMainScreen(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: ProviderRoutesConstants.dashboard,
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
                  path: ProviderRoutesConstants.boost,
                  builder: (context, state) => BoostProfileScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: ProviderRoutesConstants.editProfile,
                  builder: (context, state) => EditProfileScreen(),
                ),
              ],
            ),
          ],
        ),

        GoRoute(
          path: ProviderRoutesConstants.businessDetails,
          builder: (context, state) => BusinessDetailsScreen(),
        ),

        GoRoute(
          path: ProviderRoutesConstants.banner,
          builder: (context, state) => BusinessBannerScreen(),
        ),

        GoRoute(
          path: ProviderRoutesConstants.serviceCategoryScreen,
          builder: (context, state) => ServicesCategoryScreen(),
        ),

        GoRoute(
          path: ProviderRoutesConstants.payment,
          builder: (context, state) => ProviderPayment(),
        ),
        GoRoute(
          path: ProviderRoutesConstants.customerReview,
          builder: (context, state) => CustomerReviewsScreen(),
        ),
        GoRoute(
          path: ProviderRoutesConstants.addTeam,
          builder: (context, state) => AddTeamMemberScreen(),
          routes: [
            GoRoute(
              path: ProviderRoutesConstants.teamList,
              builder: (context, state) => TeamListScreen(),
            ),
          ],
        ),
        GoRoute(
          path: ProviderRoutesConstants.addServiceScreen,
          builder: (context, state) => AddServiceScreen(),
          routes: [
            GoRoute(
              path: ProviderRoutesConstants.viewServiceScreen,
              builder: (context, state) => ViewServiceScreen(),
            ),
          ],
        ),
        GoRoute(
          path: ProviderRoutesConstants.addAvailability,
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
