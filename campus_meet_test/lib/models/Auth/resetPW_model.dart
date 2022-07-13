class ResetPW {
  ResetPW({
    required this.name,
    required this.email
    //채팅방url
  });

  String name;
  String email;

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email
  };}