import 'package:flutter/material.dart';
import 'package:chat_app/app_routes.dart';
import 'package:chat_app/screens/chats_list_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.login,
      // initialRoute: AppRoutes.chat,
      // initialRoute: AppRoutes.chatsList,
      routes: {
        AppRoutes.chatsList: (context) => ChatsListScreen(),
        AppRoutes.chat: (context) => ChatScreen(),
        AppRoutes.login: (context) => LoginScreen(),
      },
    );
  }
}
