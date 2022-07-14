import 'onePost_model.dart';

class Posts {
  Posts({
    required this.posts,
  });

  List<Post> posts;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
  };
}