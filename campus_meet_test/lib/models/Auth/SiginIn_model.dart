class SignIn {
  SignIn({
    required this.email,
    required this.password
  });

  String email;
  String password;

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password
  };}