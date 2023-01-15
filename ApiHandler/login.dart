import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

import 'package:portfolioapp/main.dart';

Future<void> onLogin(password, username, BuildContext context) async {
  // ignore: non_constant_identifier_names
  final Response = await http.post(
    Uri.parse('http://10.0.2.2:5244/AppLogin'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'Username': username,
      'Password': password,
    }),
  );
  int statusCode = Response.statusCode.toInt();

  if (Response.body != "" && statusCode == 200) {
    if (Response.body == "no Access granted") return;
    token = Response.body;
    context.go('/home');
  } else {
    // ignore: prefer_interpolation_to_compose_strings
    log("no connection" + Response.statusCode.toString());
  }
}
