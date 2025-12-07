import 'package:chat_app/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/navigation.dart' as navigation;

class AuthController {
  String getInitialRoute() {
    if (userLoggedIn()) {
      return AppRoutes.chatsList;
    }
    return AppRoutes.login;
  }

  void openChatsList(BuildContext context) async {
    navigation.goToChatsList(context);
  }

  bool userLoggedIn() {
    if (FirebaseAuth.instance.currentUser == null) {
      return false;
    }
    return true;
  }

  Future<void> authenticateUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (context.mounted) {
        openChatsList(context);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unable to authenticate due to ${e.toString()}'),
          ),
        );
      }
    }
  }

  Future<void> registerUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (context.mounted) {
        openChatsList(context);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Unable to register due to ${e.toString()}')),
        );
      }
    }
  }

  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      navigation.goToLogin(context);
    }
  }
}
