import 'package:chat_app/pages/chat_page.dart';
import 'package:flutter/material.dart';

void showSnakBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

void goToChatPage(BuildContext context) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    ChatPage.chatRouteID,
    (route) => false,
  );
}
