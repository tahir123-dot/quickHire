import 'package:mobile/routes/auth/role_enum.dart';
import 'package:mobile/routes/professional_routes/professional_routes_constants.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

final rolePermissions = {
  UserRole.customer: [UserRoutesConstants.customer],
  UserRole.serviceProvider: [ProviderRoutesConstants.provider],
  UserRole.member: [ProfessionalRoutesConstants.professional],
};

bool isPathAllowedForRole(UserRole role, String path) {
  final allowedPrefixes = rolePermissions[role];

  if (allowedPrefixes == null) return false;

  for (final prefix in allowedPrefixes) {
    if (path.startsWith(prefix)) {
      return true;
    }
  }

  return false;
}
