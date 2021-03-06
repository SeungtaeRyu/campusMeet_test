class SignUp {
  SignUp({
    required this.email,
    required this.name,
    required this.entryYear,
    required this.nickName,
    required this.pwd,
    required this.birthDate,
    required this.sex,
  });

  String email;
  String name;
  int entryYear;
  String nickName;
  String pwd;
  DateTime birthDate; //DateTime맞나?
  String sex;

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
    email: json["email"],
    name: json["name"],
    entryYear: json["entryYear"],
    nickName: json["nickName"],
    pwd: json["pwd"],
    birthDate: json["birthDate"],
    sex: json["sex"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "name": name,
    "entryYear": entryYear,
    "nickName": nickName,
    "pwd": pwd,
    "birthDate": birthDate,
    "sex": sex
  };
}