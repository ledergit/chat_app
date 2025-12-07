import 'package:chat_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_app/app_routes.dart';
import 'package:chat_app/screens/chats_list_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('firebase allegedly initialized');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController authController = AuthController();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),

      initialRoute: authController.getInitialRoute(),
      // initialRoute: AppRoutes.login,
      // initialRoute: AppRoutes.chat,
      // initialRoute: AppRoutes.chatsList,
      routes: {
        AppRoutes.chatsList: (context) => ChatsListScreen(),
        AppRoutes.chat: (context) => ChatScreen(),
        AppRoutes.login: (context) => LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
