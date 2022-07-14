import 'dart:convert';
//post
// MeetingPropose meetingProposeFromJson(String str) => Welcome.fromJson(json.decode(str));

String meetingProposeToJson(MeetingPropose data) => json.encode(data.toJson());

class MeetingPropose {
  MeetingPropose({
    required this.id,
    required this.post,
    required this.appealText,
    required this.createdAt,
  });

  int id;
  int post;
  String appealText;
  String createdAt;

  factory MeetingPropose.fromJson(Map<String, dynamic> json) => MeetingPropose(
    id: json["id"],
    post: json["post"],
    appealText: json["appealText"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "post": post,
    "appealText": appealText,
    "createdAt": createdAt,
  };
}
