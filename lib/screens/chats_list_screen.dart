import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/controllers/auth_controller.dart';
import 'package:chat_app/controllers/chat_controller.dart';
import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/member.dart';
import 'package:flutter/material.dart';
// import 'package:chat_app/app_routes.dart';
// import 'package:chat_app/navigation.dart' as navigation;

class ChatsListScreen extends StatelessWidget {
  final ChatController chatController = ChatController();
  final AuthController authController = AuthController();
  ChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 20),
        automaticallyImplyLeading: false,
        title: Text('Chat screen'),
        // actions: [Icon(Icons.menu)],
        actions: [
          TextButton(
            onPressed: () => authController.logOut(context),
            child: Text('Log out..'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chats List'),
            Text('User: ${FirebaseAuth.instance.currentUser?.uid}'),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => chatController.openTest(context),
                  child: Text('Go to test page'),
                ),
                TextButton(
                  onPressed: () => chatController.openChat(
                    context,
                    Chat(
                      chatId: 'abc123',
                      participants: [
                        Member(
                          uid: FirebaseAuth.instance.currentUser!.uid,
                          displayName: 'matt',
                        ),
                        Member(
                          uid: '222222',
                          displayName: 'Eva Leder',
                        ),
                      ],
                    ),
                  ),
                  child: Text('Open chat'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
