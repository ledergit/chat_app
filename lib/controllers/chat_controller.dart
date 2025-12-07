import 'package:flutter/material.dart';
import 'package:chat_app/navigation.dart' as navigation;
import 'package:chat_app/models/chat.dart';

class ChatController {
  void openChat(BuildContext context, Chat chat) {
    navigation.goToChat(context, chat);
  }

  void closeChat(BuildContext context) {
    navigation.goBack(context);
  }
}
