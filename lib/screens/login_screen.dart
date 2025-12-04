import 'package:chat_app/app_routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login screen'),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.chatsList),
              child: Text('Go to chats list'),
            ),
          ],
        ),
      ),
    );
  }
}
