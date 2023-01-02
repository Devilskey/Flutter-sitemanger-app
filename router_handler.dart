import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

//screensImport
import 'Screens/PostManagementScreens/add_post_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/PostManagementScreens/post_screen.dart';

// ignore: non_constant_identifier_names
final GoRouter AppRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
        routes: <GoRoute>[
          GoRoute(
              path: 'home',
              builder: (BuildContext context, GoRouterState state) =>
                  const HomeScreen()),
          GoRoute(
              path: 'post',
              builder: (BuildContext context, GoRouterState state) =>
                  const PostScreen()),
          GoRoute(
              path: 'postadd',
              builder: (BuildContext context, GoRouterState state) =>
                  const AddPostScreen()),
        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const LoginScreen())
  ],
);
