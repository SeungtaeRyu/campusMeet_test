class User {
  User({
    required this.id,
    required this.email,
    required this.name,
    required this.entryYear,
    required this.nickname,
    required this.birthDate,
    required this.sex,
    required this.createdAt,
    required this.introText,
    required this.univ,
    required this.department,
    required this.profileImage,
  });

  int id;
  String email;
  String name;
  int entryYear;
  String nickname;
  DateTime birthDate;
  String sex;
  DateTime createdAt;
  String introText;
  String univ;
  String department;
  String profileImage;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    entryYear: json["entryYear"],
    nickname: json["nickname"],
    birthDate: DateTime.parse(json["birthDate"]),
    sex: json["sex"],
    createdAt: DateTime.parse(json["createdAt"]),
    introText: json["introText"],
    univ: json["univ"],
    department: json["department"],
    profileImage: json["profileImage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "entryYear": entryYear,
    "nickname": nickname,
    "birthDate": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    "sex": sex,
    "createdAt": createdAt.toIso8601String(),
    "introText": introText,
    "univ": univ,
    "department": department,
  };
}
