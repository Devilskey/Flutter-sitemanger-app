class Post {
  final int postId;
  final String postTitle;
  final String postContent;
  final String postTag;

  const Post({
    required this.postId,
    required this.postTitle,
    required this.postContent,
    required this.postTag,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'],
      postTitle: json['postTitle'].toString(),
      postContent: json['postContent'].toString(),
      postTag: json['postTag'].toString(),
    );
  }
}
