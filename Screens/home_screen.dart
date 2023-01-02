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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: 150, //height of button
                width: 150, //width of button
                child: ElevatedButton(
                  onPressed: () => context.go("/post"),
                  child: const Text('hi'),
                )),
            SizedBox(
                height: 150, //height of button
                width: 150, //width of button
                child: ElevatedButton(
                  onPressed: () => {},
                  child: const Text('hi'),
                )),
          ],
        )
      ],
    ));
  }
}
