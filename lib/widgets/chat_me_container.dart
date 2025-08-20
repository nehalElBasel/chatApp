import 'package:chat_app/constants/color_constants.dart';
import 'package:chat_app/constants/theme_constant.dart';
import 'package:flutter/material.dart';

class ChatMeContainer extends StatelessWidget {
  const ChatMeContainer({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(left: 10, bottom: 13),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: kChatContainerRaduis,
            topLeft: kChatContainerRaduis,
            topRight: kChatContainerRaduis,
          ),
        ),
        child: Text(message),
      ),
    );
  }
}
