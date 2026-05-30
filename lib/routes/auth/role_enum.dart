enum UserRole {
  serviceProvider("service_provider"),
  customer("customer"),
  member("member");

  final String value;
  const UserRole(this.value);
}

class UserRoleHelper {
  static UserRole fromString(String value) {
    return UserRole.values.firstWhere(
      (e) => e.value == value,
      orElse: () => UserRole.customer,
    );
  }
}
