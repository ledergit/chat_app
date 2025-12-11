import 'package:flutter/material.dart';
import 'package:chat_app/controllers/chat_controller.dart';

class TestScreen extends StatelessWidget {
  ChatController chatController = ChatController();
  TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Test page'),
            TextButton(
              onPressed: () => chatController.closeChat(context),
              child: Text('back'),
            ),
          ],
        ),
      ),
    );
  }
}
