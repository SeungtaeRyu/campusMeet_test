class VerifyEmail {
  VerifyEmail({
    required this.email,
    required this.code
    //채팅방url
  });

  String email;
  int code;

  Map<String, dynamic> toJson() => {
    "email": email,
    "code": code
  };}