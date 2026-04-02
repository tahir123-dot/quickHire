import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/become_member/screen/professional.dart';
import 'package:mobile/routes/professional_routes/professional_routes_constants.dart';

class ProfessionalRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: ProfessionalRoutesConstants.professionalHomeScreen,
      name: 'professionalHomeScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: ProfessionalHomeScreen());
      },
    ),
    GoRoute(
      path: ProfessionalRoutesConstants.professionalBookingScreen,
      name: 'professionalBookingScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: ProfessionalBookingScreen());
      },
    ),
    GoRoute(
      path: ProfessionalRoutesConstants.professionalScheduleScreen,
      name: 'professionalScheduleScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: ProfessionalScheduleScreen());
      },
    ),
    GoRoute(
      path: ProfessionalRoutesConstants.professionalProfileScreen,
      name: 'professionalProfileScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: ProfessionalProfileScreen());
      },
    ),
  ];
}
