class Friend {
  final int id;
  final int from_user;
  final int to_user;
  final bool accept;

  Friend.fromMap(
      Map<String, dynamic> map,
      )   : id = map['id'],
        from_user = map['from_user'],
        to_user = map['to_user'],
        accept = map['accept'];

  @override
  String toString() => "Friend<$from_user>";
}
