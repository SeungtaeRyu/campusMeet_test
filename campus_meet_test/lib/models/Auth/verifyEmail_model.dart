class VerifyEmail {
  VerifyEmail({
    required this.email,
    required this.code
  });

  String email;
  int code;

  factory VerifyEmail.fromJson(Map<String, dynamic> json) => VerifyEmail(
    email: json["email"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "code": code
  };
}