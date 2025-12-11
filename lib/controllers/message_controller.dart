import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/models/message.dart';

class MessageController {
  Future<void> sendMessage(
    BuildContext context,
    String chatId,
    String messageText,
  ) async {
    Message message = Message(
      chatId: chatId,
      senderId: FirebaseAuth.instance.currentUser!.uid,
      text: messageText,
      createdAt: DateTime.now(),
    );

    try {
      final docRef = await FirebaseFirestore.instance
          .collection('chats')
          .doc(message.chatId)
          .collection('messages')
          .add(message.toMap());
      print('Following docRef was just created ${docRef.id}');
    } on FirebaseException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.code)));
      }
    }
  }
}
