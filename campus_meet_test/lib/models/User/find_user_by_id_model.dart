class FindUserById {
  FindUserById({
    required this.id,
    required this.email,
    required this.name,
    required this.nickname,
    required this.entryYear,
    required this.birthDate,
    required this.sex,
    required this.createdAt,
    required this.updatedAt,
    required this.univ,
    required this.department,
    required this.introText,
    required this.character,
    required this.hobby,
    required this.ideal,
    required this.profileImages,
  });

  int id;
  String email;
  String name;
  String nickname;
  int entryYear;
  DateTime birthDate;
  String sex;
  DateTime createdAt;
  DateTime updatedAt;
  Department univ;
  Department department;
  String introText;
  String character;
  String hobby;
  String ideal;
  List<ProfileImage> profileImages;

  factory FindUserById.fromJson(Map<String, dynamic> json) => FindUserById(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    nickname: json["nickname"],
    entryYear: json["entryYear"],
    birthDate: DateTime.parse(json["birthDate"]),
    sex: json["sex"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    univ: Department.fromJson(json["univ"]),
    department: Department.fromJson(json["department"]),
    introText: json["introText"],
    character: json["character"],
    hobby: json["hobby"],
    ideal: json["ideal"],
    profileImages: List<ProfileImage>.from(json["profileImages"].map((x) => ProfileImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "nickname": nickname,
    "entryYear": entryYear,
    "birthDate": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    "sex": sex,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "univ": univ.toJson(),
    "department": department.toJson(),
    "introText": introText,
    "character": character,
    "hobby": hobby,
    "ideal": ideal,
    "profileImages": List<dynamic>.from(profileImages.map((x) => x.toJson())),
  };
}

class Department {
  Department({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class ProfileImage {
  ProfileImage({
    required this.order,
    required this.url,
  });

  int order;
  String url;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
    order: json["order"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "order": order,
    "url": url,
  };
}
