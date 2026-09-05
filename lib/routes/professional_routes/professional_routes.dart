import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/become_member/screen/professional.dart';
import 'package:mobile/routes/professional_routes/professional_routes_constants.dart';

class ProfessionalRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: ProfessionalRoutesConstants.professional, // "/professional"
      redirect: (context, state) {
        if (state.fullPath == '/professional' ||
            state.fullPath == '/professional/') {
          return '/professional/mainScreen';
        }
        return null;
      },
      routes: [
        GoRoute(
          path: ProfessionalRoutesConstants.mainScreen, // "mainScreen"
          name: 'professionalMainScreen',
          pageBuilder: (context, state) {
            return MaterialPage(child: ProfessionalMainScreen());
          },
        ),
        GoRoute(
          path: ProfessionalRoutesConstants.homeScreen, // "homeScreen"
          name: 'professionalHomeScreen',
          pageBuilder: (context, state) {
            return MaterialPage(child: ProfessionalHomeScreen());
          },
        ),
        GoRoute(
          path: ProfessionalRoutesConstants.scheduleScreen, // "scheduleScreen"
          name: 'professionalScheduleScreen',
          pageBuilder: (context, state) {
            return MaterialPage(child: ProfessionalScheduleScreen());
          },
        ),
      ],
    ),
  ];
}
