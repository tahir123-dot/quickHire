// signup request dto
class SignupDto {
  String name;
  String email;
  String password;
  String role;

  SignupDto({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "password": password, "role": role};
  }
}
