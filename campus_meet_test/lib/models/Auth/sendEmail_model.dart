class SendEmail {
  SendEmail({
    required this.email
  });

  String email;


  Map<String, dynamic> toJson() => {
    "email": email
  };
}