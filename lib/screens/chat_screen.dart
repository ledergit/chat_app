import 'package:chat_app/controllers/chat_controller.dart';
import 'package:chat_app/controllers/message_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final MessageController messageController = MessageController();
  final ChatController chatController = ChatController();
  final TextEditingController textController = TextEditingController();
  // final List<Message> messages;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chat = ModalRoute.of(context)!.settings.arguments as Chat;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 235, 245),
        // leading: Icon(Icons.arrow_back_ios_new),
        leading: IconButton(
          onPressed: () => chatController.closeChat(context),
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            Icon(
              Icons.account_circle,
              size: 32,
              color: Color.fromARGB(255, 110, 100, 100),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              chat.participants
                  .firstWhere(
                    (p) => p.uid != FirebaseAuth.instance.currentUser!.uid,
                  )
                  .displayName,
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              height: 1,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Chat: ${chat.chatId}'),
            SizedBox(
              height: 100,
            ),

            Expanded(
              child: StreamBuilder<List<Message>>(
                stream: chatController.watchMessages(chat.chatId),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<Message> messages = snapshot.data!;
                    return ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, i) {
                        return Text(messages[i].text);
                      },
                    );
                  }
                },
              ),
            ),
            // Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final text = textController.text.trim();
                      if (text.isEmpty) return;
                      messageController.sendMessage(
                        context,
                        chat.chatId,
                        textController.text,
                      );
                      textController.clear();
                    },
                    child: Text('Send'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
