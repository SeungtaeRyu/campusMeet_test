class VerifyEmail {
  VerifyEmail({
    required this.email,
    required this.code
  });

  String email;
  int code;

  Map<String, dynamic> toJson() => {
    "email": email,
    "code": code
  };}