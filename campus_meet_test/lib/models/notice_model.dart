class Notice {
  final String emoji;
  final String title;
  final String header;
  final String paragraph;
  final String date;


  Notice.fromMap(
      Map<String, dynamic> map,
      )   : emoji = map['emoji'],
        title = map['title'],
        header = map['header'],
        paragraph = map['paragraph'],
        date = map['date'];

  @override
  String toString() => "Notice<$title>";
}
