import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => PostScreenWidget();
}

class PostScreenWidget extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: SizedBox(
              width: 350, //width of button
              child: ElevatedButton(
                  onPressed: () => context.go("/postadd"),
                  child: const Text("Create new post"))),
        ),
      ],
    ));
  }
}
