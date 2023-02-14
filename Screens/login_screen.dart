import 'package:flutter/material.dart';
import '../Managers/ApiHandler/Login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => LoginScreenWidget();
}

class LoginScreenWidget extends State<LoginScreen> {
  final password = TextEditingController();
  final username = TextEditingController();

  @override
  void dispose() {
    password.dispose();
    username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Login",
          style: TextStyle(fontSize: 25),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: TextField(
              controller: username,
              decoration: const InputDecoration(
                  icon: Icon(Icons.account_box),
                  hintText: 'Username',
                  border: OutlineInputBorder(),
                  labelText: 'Username'),
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: TextField(
              controller: password,
              decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  labelText: 'Password'),
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: ElevatedButton(
            onPressed: () => {onLogin(password.text, username.text, context)},
            child: const Text('Login'),
          ),
        ),
      ],
    ));
  }
}
