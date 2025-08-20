import 'package:chat_app/constants/text_constants.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static final chatRouteID = kChatRoute;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Text("chat"));
  }
}
