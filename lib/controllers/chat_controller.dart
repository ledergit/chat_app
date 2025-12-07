import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app/navigation.dart' as navigation;
import 'package:chat_app/models/chat.dart';

class ChatController {
  void openChat(BuildContext context, Chat chat) async {
    print('try writing to db');
    await testWriteToFirestore();
    navigation.goToChat(context, chat);
  }

  void closeChat(BuildContext context) {
    navigation.goBack(context);
  }

  Future<void> testWriteToFirestore() async {
    await FirebaseFirestore.instance.collection('test').add({
      'text': 'hello!',
    });
  }
}
