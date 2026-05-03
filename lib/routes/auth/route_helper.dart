import 'package:mobile/routes/auth/role.dart';
import 'package:mobile/routes/professional_routes/professional_routes_constants.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';
import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

String getHomeRoute(String role) {
  return roleHomeRoute[role] ?? SharedRoutesConstant.loginScreen;
}

final Map<String, String> roleHomeRoute = {
  Role.customer: UserRoutesConstants.userMainScreen,
  Role.serviceProvider: ProviderRoutesConstants.providerMainScreen,
  Role.member: ProfessionalRoutesConstants.professionalMainScreen,
};
