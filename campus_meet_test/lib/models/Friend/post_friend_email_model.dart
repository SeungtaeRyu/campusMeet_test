class FriendEmail {
  FriendEmail({
    required this.email,
  });

  String email;

  factory FriendEmail.fromJson(Map<String, dynamic> json) => FriendEmail(
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
  };
}