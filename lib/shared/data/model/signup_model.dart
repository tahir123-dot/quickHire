// signup response dto
class SignupResponseModel {
  final String name;
  final String email;
  final String activeRole;

  SignupResponseModel({
    required this.name,
    required this.email,
    required this.activeRole,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      name: json["name"],
      email: json["email"],
      activeRole: json["activeRole"],
    );
  }
}
