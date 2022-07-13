

import 'onePostGet_model.dart';

class Posts {
  Posts({
    required this.posts,
  });

  List<PostGet> posts;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    posts: List<PostGet>.from(json["posts"].map((x) => PostGet.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
  };
}