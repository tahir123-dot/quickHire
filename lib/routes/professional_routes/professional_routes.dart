import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/become_member/screen/professional.dart';
import 'package:mobile/routes/professional_routes/professional_routes_constants.dart';

class ProfessionalRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: ProfessionalRoutesConstants.professionalMainScreen,
      name: 'professionalMainScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: ProfessionalMainScreen());
      },
    ),
    GoRoute(
      path: ProfessionalRoutesConstants.professionalHomeScreen,
      name: 'professionalHomeScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: ProfessionalHomeScreen());
      },
    ),
    GoRoute(
      path: ProfessionalRoutesConstants.professionalScheduleScreen,
      name: 'professionalScheduleScreen',
      pageBuilder: (context, state) {
        return MaterialPage(child: ProfessionalScheduleScreen());
      },
    ),
  ];
}
