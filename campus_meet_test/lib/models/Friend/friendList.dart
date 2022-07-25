class FriendList {
  FriendList({
    required this.id,
    required this.friend,
  });

  int id;
  Friend friend;

  factory FriendList.fromJson(Map<String, dynamic> json) => FriendList(
    id: json["id"],
    friend: Friend.fromJson(json["friend"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "friend": friend.toJson(),
  };
}

class Friend {
  Friend({
    required this.id,
    required this.email,
    required this.name,
    required this.nickname,
  });

  int id;
  String email;
  String name;
  String nickname;

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    nickname: json["nickname"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "nickname": nickname,
  };
}
