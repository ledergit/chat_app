import 'package:chat_app/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/models/chat.dart';

class ChatScreen extends StatelessWidget {
  final ChatController chatController = ChatController();
  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chat = ModalRoute.of(context)!.settings.arguments as Chat;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chat screen for id ${chat.chatId}'),
            Text('Chat participants:'),
            ...chat.participants.map(
              (e) => Text(e),
            ),
            TextButton(
              onPressed: () => chatController.closeChat(context),
              child: Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}
