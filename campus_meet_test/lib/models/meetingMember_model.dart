
class MeetingMember {
  MeetingMember({
    required this.members,
  });

  List<Member> members;

  factory MeetingMember.fromJson(Map<String, dynamic> json) => MeetingMember(
    members: List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "members": List<dynamic>.from(members.map((x) => x.toJson())),
  };
}

class Member {
  Member({
    required this.id,
    required this.univ,
    required this.entryYear,
    required this.name,
    required this.profileImages,
  });

  int id;
  String univ;
  int entryYear;
  String name;
  List<String> profileImages;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    id: json["id"],
    univ: json["univ"],
    entryYear: json["entryYear"],
    name: json["name"],
    profileImages: List<String>.from(json["profileImages"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "univ": univ,
    "entryYear": entryYear,
    "name": name,
    "profileImages": List<dynamic>.from(profileImages.map((x) => x)),
  };
}
