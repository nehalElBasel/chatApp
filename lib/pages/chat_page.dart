import 'package:chat_app/constants/color_constants.dart';
import 'package:chat_app/constants/text_constants.dart';
import 'package:chat_app/constants/theme_constant.dart';
import 'package:chat_app/helper.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/services/firebase_auth.dart';
import 'package:chat_app/services/firebase_firestore.dart';
import 'package:chat_app/widgets/chat_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static final chatRouteID = kChatRoute;
  late TextEditingController controller = TextEditingController();

  _addMessage(BuildContext context, MessageModel message) async {
    print("add message");
    if (message.message.trim().isEmpty) {
      showSnakBar(context, "please message cannot be empty");
    } else {
      try {
        await CustomFirebaseFireStore().addMessage(message);
        controller.text = "";
      } catch (e) {
        showSnakBar(context, e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String name = FirebaseAuth.instance.currentUser!.email!.split("@")[0] ?? "";
    return Scaffold(
      backgroundColor: kChatPageBackgroundColor,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("Welcome $name"),
        actions: [
          IconButton(
            onPressed: () async {
              try {
                await CustomFireBaseAuth.signOut();
              } catch (error) {
                showSnakBar(context, error.toString());
              }
            },
            icon: Icon(Icons.logout),
          ),
        ],
        backgroundColor: kChatPageBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ChatMessages()),
            SizedBox(height: 15),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: kChatTextBorder,
                focusedBorder: kChatTextBorder,
                suffixIcon: IconButton(
                  onPressed: () {
                    MessageModel message = MessageModel(
                      userID: FirebaseAuth.instance.currentUser!.uid,
                      message: controller.text,
                      date: DateTime.now(),
                    );
                    _addMessage(context, message);
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
