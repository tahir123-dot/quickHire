import 'package:mobile/routes/auth/role_enum.dart';
import 'package:mobile/routes/professional_routes/professional_routes_constants.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

final rolePermissions = {
  UserRole.user: UserRoutesConstants.all,
  UserRole.provider: ProviderRoutesConstants.all,
  UserRole.professional: ProfessionalRoutesConstants.all,
};
