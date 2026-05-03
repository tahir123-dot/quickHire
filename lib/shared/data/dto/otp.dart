// otp request dto
class OtpDto {
  String email;
  String otp;
  OtpDto({required this.email, required this.otp});

  Map<String, dynamic> toJson() {
    return {"email": email, "otpCode": otp};
  }
}
