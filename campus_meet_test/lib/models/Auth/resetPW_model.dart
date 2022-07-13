class ResetPW {
  ResetPW({
    required this.name,
    required this.email
  });

  String name;
  String email;

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email
  };}