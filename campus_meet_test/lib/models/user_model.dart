class User {
  final String name;
  final String university;
  final int studentId;
  final int age;
  final String gender;
  final String profileImage;
  final String birthday;
  final String introduction;

  User.fromMap(
      Map<String, dynamic> map,
      )   : name = map['name'],
        university = map['university'],
        studentId = map['studentId'],
        age = map['age'],
        gender = map['gender'],
        profileImage = map['profileImage'],
        birthday = map['birthday'],
        introduction = map['introduction'];

  @override
  String toString() => "User<$name:$university>";
}
