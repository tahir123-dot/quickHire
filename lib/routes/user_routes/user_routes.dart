import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/export_screen/screen_exports.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

class UserRoutes {
  static final List<RouteBase> routes = [
    GoRoute(
      path: '/customer',
      redirect: (context, state) {
        if (state.fullPath == '/customer' || state.fullPath == '/customer/') {
          return '/customer/home';
        }
        return null;
      },

      routes: [
        // SHELL — only wraps the 4 bottom nav screens
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return UserMainScreen(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: UserRoutesConstants.home, // "home"
                  builder: (context, state) => HomeScreen(),
                ),
              ],
            ),

            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: UserRoutesConstants.booking, // "booking"
                  builder: (context, state) => BookingScreen(),
                ),
              ],
            ),

            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: UserRoutesConstants.chat, // "chat"
                  builder: (context, state) => ChatScreen(),
                ),
              ],
            ),

            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: UserRoutesConstants.profile, // "profile"
                  builder: (context, state) => ProfileScreen(),
                ),
              ],
            ),
          ],
        ),

        // ✅ OUTSIDE SHELL — no bottom nav bar on these screens
        // RULE: these are children of '/customer', so use RELATIVE paths only.
        // GoRouter will build the full path as: parent + "/" + child
        // So "profile/phone" becomes "/customer/profile/phone" automatically.
        GoRoute(
          path: 'profile/phone', // ✅ relative — NOT '/customer/profile/phone'
          builder: (context, state) => PhoneNumberScreen(),
        ),

        GoRoute(
          path:
              'profile/payment', // ✅ relative — NOT '/customer/profile/payment'
          builder: (context, state) => UserPayment(),
        ),

        GoRoute(
          path: 'home/service-provider', // ✅ relative
          builder: (context, state) => ProfileViewScreen(),
        ),

        GoRoute(
          path: 'booking/booking-detail', // ✅ relative
          builder: (context, state) => BookingDetailScreen(),
        ),

        // booking flow

        // profile open of provider
        GoRoute(
          path: 'providerProfile',
          builder: (context, state) => ProfileViewScreen(),
        ),

        // select professional
        GoRoute(
          path: 'teamSelect',
          builder: (context, state) => SelectProfessional(),
        ),

        // select date and time
        GoRoute(
          path: 'calendar',
          builder: (context, state) => UserCalenderScreen(),
        ),

        // see booking Preview
        GoRoute(
          path: 'bookingPreview',
          builder: (context, state) => BookingDetailScreen(),
        ),

        // booking flow end because confirmed
      ],
    ),
  ];
}
