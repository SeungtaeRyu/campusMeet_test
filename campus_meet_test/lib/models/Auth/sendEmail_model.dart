class SendEmail {
  SendEmail({
    required this.email
    //채팅방url
  });

  String email;


  Map<String, dynamic> toJson() => {
    "email": email
  };}