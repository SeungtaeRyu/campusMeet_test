class FriendEmail {
  FriendEmail({
    required this.email,
  });

  String email;

  Map<String, dynamic> toJson() => {
    "email": email,
  };
}