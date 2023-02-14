class Post {
  final int postId;
  final String postTitle;
  final String postContent;
  final String postTag;
  final String postThumbnail;

  const Post(
      {required this.postId,
      required this.postTitle,
      required this.postContent,
      required this.postTag,
      required this.postThumbnail});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'],
      postTitle: json['PostTitle'].toString(),
      postContent: json['PostContent'].toString(),
      postTag: json['PostTag'].toString(),
      postThumbnail: json['thumbnail'].toString(),
    );
  }
}
