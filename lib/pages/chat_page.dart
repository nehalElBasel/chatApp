import 'package:chat_app/constants/color_constants.dart';
import 'package:chat_app/constants/text_constants.dart';
import 'package:chat_app/widgets/chat_friend_container.dart';
import 'package:chat_app/widgets/chat_me_container.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static final chatRouteID = kChatRoute;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kChatPageBackgroundColor,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: kChatPageBackgroundColor,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) => ChatFriendContainer(),
      ),
    );
  }
}
