class ResetPW {
  ResetPW({
    required this.name,
    required this.email
  });

  String name;
  String email;

  factory ResetPW.fromJson(Map<String, dynamic> json) => ResetPW(
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "email": email
      };
}