import 'package:chat_app/app_routes.dart';
import 'package:flutter/material.dart';

class ChatsListScreen extends StatelessWidget {
  const ChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Chat screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chats List'),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.chat),
              child: Text('Open chat'),
            ),
          ],
        ),
      ),
    );
  }
}
