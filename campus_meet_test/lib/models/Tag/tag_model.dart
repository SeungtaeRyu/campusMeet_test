class Tag {
  Tag({
    required this.id,
    required this.text,
  });

  int id;
  String text;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
  };
}
