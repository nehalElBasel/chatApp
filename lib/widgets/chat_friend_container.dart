import 'package:chat_app/constants/color_constants.dart';
import 'package:chat_app/constants/theme_constant.dart';
import 'package:flutter/material.dart';

class ChatFriendContainer extends StatelessWidget {
  const ChatFriendContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(right: 10, bottom: 13),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: kChatFriendBubbleColor,
          borderRadius: BorderRadius.only(
            bottomLeft: kChatContainerRaduis,
            topLeft: kChatContainerRaduis,
            topRight: kChatContainerRaduis,
          ),
        ),
        child: Text("data"),
      ),
    );
  }
}
