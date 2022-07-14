class SendEmail {
  SendEmail({
    required this.email
  });

  String email;

  factory SendEmail.fromJson(Map<String, dynamic> json) => SendEmail(
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "email": email
  };
}