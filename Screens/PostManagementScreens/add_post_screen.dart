import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../ApiHandler/post_manager.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => AddPostScreenWidget();
}

class AddPostScreenWidget extends State<AddPostScreen> {
  final title = TextEditingController();
  final content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: ElevatedButton(
                onPressed: () => {context.go('/post')},
                child: const Text("back"))),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextField(
              controller: title,
              decoration: const InputDecoration(
                icon: Icon(Icons.title),
                hintText: 'Title of post',
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SizedBox(
                width: 300,
                height: 300,
                child: TextField(
                    controller: content,
                    decoration: const InputDecoration(
                      hintText: 'Content of post',
                      border: OutlineInputBorder(),
                    )))),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () =>
                      {createNewPost(title.text, content.text, context)},
                  child: const Text('Create new post'),
                ))),
      ],
    ));
  }
}
