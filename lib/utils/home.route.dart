import 'package:mobile/routes/auth/role_enum.dart';
import 'package:mobile/routes/professional_routes/professional_routes_constants.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

String getHomeRoute(UserRole role) {
  switch (role) {
    case UserRole.customer:
      return UserRoutesConstants.customer;
    case UserRole.serviceProvider:
      return '${ProviderRoutesConstants.provider}/${ProviderRoutesConstants.serviceCategoryScreen}';
    case UserRole.member:
      return '${ProfessionalRoutesConstants.professional}/${ProfessionalRoutesConstants.mainScreen}';
  }
}
