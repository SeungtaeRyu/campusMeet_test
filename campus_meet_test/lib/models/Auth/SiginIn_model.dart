// signin API 바디에 id 들어가있는거 뭐야?
class SignIn {
  SignIn({
    required this.email,
    required this.password
    //채팅방url
  });

  String email;
  String password;

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password
  };}