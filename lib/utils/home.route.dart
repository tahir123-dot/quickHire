import 'package:mobile/routes/auth/role_enum.dart';
import 'package:mobile/routes/professional_routes/professional_routes_constants.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

String getHomeRoute(UserRole role) {
  switch (role) {
    case UserRole.customer:
      return UserRoutesConstants.mainScreen;
    case UserRole.serviceProvider:
      return ProviderRoutesConstants.provider;
    case UserRole.member:
      return ProfessionalRoutesConstants.professionalMainScreen;
  }
}
