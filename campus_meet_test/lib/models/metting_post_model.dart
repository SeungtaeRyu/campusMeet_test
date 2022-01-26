class MeetingPost {
  final int id;
  final String title;
  final String location;
  final String createdAt;
  final List<String> keyword;
  final String writerId;
  final int numMember;



  MeetingPost.fromMap(
      Map<String, dynamic> map,
      )   : id = map['id'],
        title = map['title'],
        location = map['location'],
        createdAt = map['createdAt'],
        keyword = map['keyword'],
        writerId = map['writerId'],
        numMember = map['numMember'];

  @override
  String toString() => "MeetingPost<$title>";
}
