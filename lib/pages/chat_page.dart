import 'package:chat_app/constants/color_constants.dart';
import 'package:chat_app/constants/text_constants.dart';
import 'package:chat_app/constants/theme_constant.dart';
import 'package:chat_app/helper.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/services/firebase_auth.dart';
import 'package:chat_app/services/firebase_firestore.dart';
import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/custom_logout_.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static final chatRouteID = kChatRoute;
  late TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  _addMessage(BuildContext context) async {
    MessageModel message = MessageModel(
      userID: CustomFireBaseAuth.UserID,
      message: controller.text,
      date: DateTime.now(),
    );
    if (message.message.trim().isEmpty) {
      showSnakBar(context, "please message cannot be empty");
    } else {
      try {
        await CustomFirebaseFireStore().addMessage(message);
        controller.text = "";
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      } catch (e) {
        showSnakBar(context, e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String name = CustomFireBaseAuth.userName.split("@")[0];
    return Scaffold(
      backgroundColor: kChatPageBackgroundColor,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("Welcome $name"),
        actions: [CustomLogOut()],
        backgroundColor: kChatPageBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ChatMessages(
                controller: controller,
                scrollController: _scrollController,
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: kChatTextBorder,
                focusedBorder: kChatTextBorder,
                suffixIcon: IconButton(
                  onPressed: () {
                    _addMessage(context);
                  },
                  icon: Icon(Icons.send, color: kPrimaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
