class MeetingMember {
  MeetingMember({
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

  factory MeetingMember.fromJson(Map<String, dynamic> json) => MeetingMember(
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