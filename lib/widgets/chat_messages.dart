import 'package:chat_app/helper.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/services/firebase_auth.dart';
import 'package:chat_app/services/firebase_firestore.dart';
import 'package:chat_app/widgets/chat_friend_container.dart';
import 'package:chat_app/widgets/chat_me_container.dart';
import 'package:chat_app/widgets/custom_circular_indecator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages({super.key});

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  // Future<QuerySnapshot<Object?>>? messages;
  Future<List<MessageModel>>? messages;

  @override
  void initState() {
    messages = getMessages();
    super.initState();
  }

  Future<List<MessageModel>> getMessages() async {
    try {
      return await CustomFirebaseFireStore().getMessages();
    } catch (error) {
      showSnakBar(context, error.toString());
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MessageModel>>(
      future: messages,
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messages = snapshot.data!;
          return ListView.builder(
            itemCount: messages.length,
            itemBuilder: (ctx, index) {
              if (messages[index].userID ==
                  FirebaseAuth.instance.currentUser!.uid) {
                return ChatMeContainer(message: messages[index].message);
              } else {
                return ChatFriendContainer(message: messages[index].message);
              }
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("Error try again"));
        } else {
          return CustomCircularIndecator();
        }
      },
    );
  }
}
