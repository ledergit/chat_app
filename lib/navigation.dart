import 'package:flutter/material.dart';
import 'package:chat_app/app_routes.dart';

void goToChatsList(BuildContext context) {
  Navigator.pushReplacementNamed(context, AppRoutes.chatsList);
}

void goToChat(BuildContext context, chat) {
  Navigator.pushNamed(context, AppRoutes.chat, arguments: chat);
}

void goBack(BuildContext context) {
  Navigator.pop(context);
}

void goToLogin(BuildContext context) {
  Navigator.pushReplacementNamed(context, AppRoutes.login);
}
