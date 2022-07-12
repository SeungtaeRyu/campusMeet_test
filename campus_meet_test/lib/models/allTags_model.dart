import 'oneTag_model.dart';

class Tags {
  Tags({
    required this.tags,
  });

  List<Tag> tags;

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
  };
}