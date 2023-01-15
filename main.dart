// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'router_handler.dart';

String token = "";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerDelegate: AppRouter.routerDelegate,
        routeInformationParser: AppRouter.routeInformationParser,
        routeInformationProvider: AppRouter.routeInformationProvider,
      );
}
