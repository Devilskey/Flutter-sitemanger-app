import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../ApiHandler/post_manager.dart';
import '../../Objects/post_object.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => PostScreenWidget();
}

class PostScreenWidget extends State<PostScreen> {
  bool loading = true;
  List<Post> postList = <Post>[];
  int LengthList = 0;
  late int index;

  @override
  void initState() {
    super.initState();

    loading = true;
    getlist();
  }

  Future<void> getlist() async {
    Future<List<Post>> postDataRecieved = getPostTitles();
    List<Post> list = await postDataRecieved;
    postList = list;
    try {
      if (postList.isNotEmpty) {
        LengthList = postList.length;
      } else if (postList.elementAt(0).postTag != "") {
        LengthList = 1;
      }
    } catch (error) {
      log(error.toString());
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading != false) {
      getlist();
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: !loading
            ? Column(
                children: [
                  Row(children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: ElevatedButton(
                            onPressed: () => {context.go('/home')},
                            child: const Text("back"))),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                      child: SizedBox(
                          width: 275, //width of button
                          child: ElevatedButton(
                              onPressed: () => context.go("/postadd"),
                              child: const Text("Create new post"))),
                    )
                  ]),
                  if (postList.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: LengthList,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            log(postList.elementAt(index).postTitle);
                            return Row(children: [
                              Text("${postList.elementAt(index).postTitle}"),
                              const Expanded(child: SizedBox()),
                              SizedBox(
                                  child: ElevatedButton(
                                      onPressed: () => {
                                            deletePostById(postList
                                                .elementAt(index)
                                                .postId),
                                          },
                                      child: const Text("Delete"))),
                              ElevatedButton(
                                  onPressed: () => {},
                                  child: const Text("Edit"))
                            ]);
                          }),
                    )
                  else
                    const Text("no post made"),
                ],
              )
            : const CircularProgressIndicator());
  }
}
