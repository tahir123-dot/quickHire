import 'package:mobile/routes/auth/role.dart';
import 'package:mobile/routes/professional_routes/professional_routes.dart';
import 'package:mobile/routes/provider_routes/provider_routes.dart';
import 'package:mobile/routes/shared_routes/shared_routes.dart';
import 'package:mobile/routes/user_routes/user_routes.dart';

class RouteAccess {
  static final Map<String, List<String>> roleRoutes = {
    Role.customer: UserRoutes.routes.map((e) => e.path).toList(),
    Role.serviceProvider: ProviderRoutes.routes.map((e) => e.path).toList(),
    Role.member: ProfessionalRoutes.routes.map((e) => e.path).toList(),
  };

  static final List<String> sharedRoutes = SharedRoutes.routes
      .map((e) => e.path)
      .toList();

  static bool canAccess(String role, String route) {
    if (sharedRoutes.contains(route)) return true;

    final allowed = roleRoutes[role] ?? [];
    return allowed.contains(route);
  }
}
