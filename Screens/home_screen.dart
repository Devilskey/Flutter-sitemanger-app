import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenWidget();
}

class HomeScreenWidget extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: 150, //height of button
            width: 380, //width of button
            child: ElevatedButton(
              onPressed: () => context.go("/post"),
              child: const Text('CreateNewPost'),
            )),
        SizedBox(
            height: 150, //height of button
            width: 380, //width of button
            child: ElevatedButton(
              onPressed: () => {},
              child: const Text('hi'),
            )),
      ],
    ));
  }
}
