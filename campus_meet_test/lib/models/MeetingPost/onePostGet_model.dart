//meetingPost도 이거 쓰기로 했음
//modifyPost도 이거 쓴다
// 수정사항 있다!!!!!!!!!!!!!!!
import '../Location/oneLocation_model.dart';
import '../Tag/oneTag_model.dart';

class PostGet {
  PostGet({
    required this.id,
    required this.location,
    required this.writer,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.numOfMember,
    required this.tags,
    required this.members,
    //채팅방url
  });

  int id;
  Location location;
  Writer writer;
  String title;
  DateTime createdAt;
  DateTime updatedAt;
  int numOfMember;
  List<Tag> tags;
  String members;
  //채팅방url

  factory PostGet.fromJson(Map<String, dynamic> json) => PostGet(
    id: json["id"],
    location: Location.fromJson(json["location"]),
    writer: Writer.fromJson(json["writer"]),
    title: json["title"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    numOfMember: json["numOfMember"],
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    members: json["members"],
    //채팅방url
  );

  Map<String, dynamic> toJson() => {
    "id": id, //안보내도 되는거지요?
    "location": location.toJson(),
    "writer": writer.toJson(),
    "title": title,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "numOfMember": numOfMember,
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "members": members,
    //채팅url 요청함
  };
}

class Writer {
  Writer({
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

  factory Writer.fromJson(Map<String, dynamic> json) => Writer(
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
