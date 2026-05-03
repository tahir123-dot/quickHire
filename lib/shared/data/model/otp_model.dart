class VerifyOtpResponseModel {
  final String message;
  final ResponseModelToken response;

  VerifyOtpResponseModel({required this.message, required this.response});

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponseModel(
      message: json['message'] as String,
      response: ResponseModelToken.fromJson(json['response']),
    );
  }
}

class ResponseModelToken {
  final bool success;
  final String message;
  final String token;

  ResponseModelToken({
    required this.success,
    required this.message,
    required this.token,
  });

  factory ResponseModelToken.fromJson(Map<String, dynamic> json) {
    return ResponseModelToken(
      success: json['success'] as bool,
      message: json['message'] as String,
      token: json['token'] as String,
    );
  }
}
