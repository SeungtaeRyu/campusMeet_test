class SignIn {
  SignIn({
    required this.email,
    required this.password
  });

  String email;
  String password;

  factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password
  };
}