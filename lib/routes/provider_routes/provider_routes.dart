import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/export_screen/screen_exports.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';

class ProviderRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: ProviderRoutesConstants.providerMainScreen,
      name: 'providerMainScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: ProviderMainScreen());
      },
    ),
    GoRoute(
      path: ProviderRoutesConstants.providerHome,
      name: 'providerHome',
      pageBuilder: (context, state) {
        return MaterialPage(child: ProviderHomeScreen());
      },
    ),
    GoRoute(
      path: ProviderRoutesConstants.providerBookingDetails,
      name: 'providerBookingDetails',
      pageBuilder: (context, state) {
        return MaterialPage(child: ProviderBookingDetailScreen());
      },
    ),
    GoRoute(
      path: ProviderRoutesConstants.providerCategory,
      name: 'providerCategory',
      pageBuilder: (context, state) {
        return MaterialPage(child: CategoryInfoScreen());
      },
    ),
    GoRoute(
      path: ProviderRoutesConstants.providerEditProfile,
      name: 'providerEditProfile',
      pageBuilder: (context, state) {
        return MaterialPage(child: EditProfileScreen());
      },
    ),
    GoRoute(
      path: ProviderRoutesConstants.providerAddAvailability,
      name: 'providerAddAvailability',
      pageBuilder: (context, state) {
        return MaterialPage(child: AddAvailabilityScreen());
      },
    ),
    GoRoute(
      path: ProviderRoutesConstants.providerAddTeam,
      name: 'providerAddTeam',
      pageBuilder: (context, state) {
        return MaterialPage(child: AddTeamMemberScreen());
      },
    ),
    GoRoute(
      path: ProviderRoutesConstants.providerTeamList,
      name: 'providerTeamList',
      pageBuilder: (context, state) {
        return MaterialPage(child: TeamListScreen());
      },
    ),
    GoRoute(
      path: ProviderRoutesConstants.selectProfessional,
      name: 'selectProfessional',
      pageBuilder: (context, state) {
        return MaterialPage(child: SelectProfessional());
      },
    ),
    GoRoute(
      path: ProviderRoutesConstants.providerProfileView,
      name: 'providerProfileView',
      pageBuilder: (context, state) {
        return MaterialPage(child: ProfileViewScreen());
      },
    ),
    GoRoute(
      path: ProviderRoutesConstants.addServiceScreen,
      name: 'addServiceScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: AddServiceScreen());
      },
    ),
    GoRoute(
      path: ProviderRoutesConstants.providerCustomerReview,
      name: 'providerCustomerReview',
      pageBuilder: (context, state) {
        return MaterialPage(child: CustomerReviewsScreen());
      },
    ),
    GoRoute(
      path: ProviderRoutesConstants.providerPayment,
      name: 'providerPayment',
      pageBuilder: (context, state) {
        return MaterialPage(child: ProviderPayment());
      },
    ),
    GoRoute(
      path: ProviderRoutesConstants.providerBoost,
      name: 'providerBoost',
      pageBuilder: (context, state) {
        return MaterialPage(child: BoostProfileScreen());
      },
    ),
    GoRoute(
      path: ProviderRoutesConstants.providerAccountOverView,
      name: 'providerAccountOverView',
      pageBuilder: (context, state) {
        return MaterialPage(child: AccountOverviewScreen());
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
