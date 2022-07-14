// 수정있다 onePostGet랑 비슷함
import '../Location/oneLocation_model.dart';
import '../Tag/oneTag_model.dart';

class PostPost {
  PostPost({
    required this.location,
    required this.title,
    required this.numOfMember,
    required this.tags,
    required this.members,
    //채팅방url
  });

  Location location;
  String title;
  int numOfMember;
  List<Tag> tags;
  List<int> members;

  factory PostPost.fromJson(Map<String, dynamic> json) => PostPost(

    location: Location.fromJson(json["location"]),
    title: json["title"],
    numOfMember: json["numOfMember"],
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    members: List<int>.from(json["members"].map((x) => x)),
    //채팅방url
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "title": title,
    "numOfMember": numOfMember,
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "members": members,
    //채팅url 요청함
  };}