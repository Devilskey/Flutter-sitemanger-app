import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:portfolioapp/main.dart';
import 'dart:convert';
import 'dart:developer';

import '../Objects/post_object.dart';

Future<void> createNewPost(title, content, BuildContext context) async {
  // ignore: non_constant_identifier_names
  final Response = await http.post(
    Uri.parse('http://10.0.2.2:5244/PostManager'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'token': token,
      'postTitle': title,
      'postContent': content,
      'postTag': 'public'
    }),
  );
  int statusCode = Response.statusCode.toInt();
  log(statusCode.toString());

  if (statusCode == 200) {
    // ignore: use_build_context_synchronously
    context.go('/home');
  }
}

Future<void> deletePostById(int postId) async {
  // ignore: non_constant_identifier_names
  final Response =
      await http.delete(Uri.parse('http://10.0.2.2:5244/PostManager'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'token': token,
            'postid': postId.toString(),
          }));
  int statusCode = Response.statusCode.toInt();
  if (statusCode == 200) log('post Deleted');
  log(Response.body);
}

Future<List<Post>> getPostTitles() async {
  // ignore: non_constant_identifier_names
  final Response = await http.get(Uri.parse('http://10.0.2.2:5244/PostMenu'));
  int statusCode = Response.statusCode.toInt();
  List<Post> postList = <Post>[];
  if (statusCode == 200) {
    postList = getPost(Response.body);
  }
  log(statusCode.toString());
  return postList;
}

// A function that converts a response body into a List<Photo>.
List<Post> getPost(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  log(responseBody);
  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}
