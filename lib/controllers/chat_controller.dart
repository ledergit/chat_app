import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app/navigation.dart' as navigation;
import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/message.dart';

class ChatController {
  void openChat(BuildContext context, Chat chat) async {
    // print('try writing to db');
    // await testWriteToFirestore();
    navigation.goToChat(context, chat);
  }

  void closeChat(BuildContext context) {
    navigation.goBack(context);
  }

  void openTest(BuildContext context) {
    navigation.goToTestScreen(context);
  }

  Future<void> testWriteToFirestore() async {
    await FirebaseFirestore.instance.collection('test').add({
      'text': 'hello!',
    });
  }
  /*
  Future<List<Message>> getMessages(String chatId) {
    final query = FirebaseFirestore.instance.collection('messages').where('chatId', isEqualTo: chatId).orderBy('timestamp');
    return query.
  }
  */

  Future<List<Message>> getMessages(String chatId) async {
    List<Message> messages = [];
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .orderBy('createdAt')
          .get();
      for (final doc in snapshot.docs) {
        messages.add(Message.fromMap(doc.data() as Map<String, dynamic>));
      }
    } on FirebaseException catch (e) {
      print('error code: ${e.code}');
    }
    return messages;
  }

  Stream<List<Message>> watchMessages(String chatId) {
    final Stream<QuerySnapshot<Map<String, dynamic>>> snapshotsStream =
        FirebaseFirestore.instance
            .collection('chats')
            .doc(chatId)
            .collection('messages')
            .orderBy('createdAt')
            .snapshots();
    return snapshotsStream.map((snapshot) {
      return snapshot.docs.map((doc) => Message.fromMap(doc.data())).toList();
    });
  }
}
