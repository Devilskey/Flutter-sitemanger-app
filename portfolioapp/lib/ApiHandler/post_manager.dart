import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

Future<void> createNewPost(title, content, BuildContext context) async {
  // ignore: non_constant_identifier_names
  final Response = await http.post(
    Uri.parse('http://10.0.2.2:5244/Post'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
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
