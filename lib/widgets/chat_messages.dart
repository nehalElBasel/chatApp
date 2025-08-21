import 'package:chat_app/helper.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/services/firebase_firestore.dart';
import 'package:chat_app/widgets/chat_friend_container.dart';
import 'package:chat_app/widgets/chat_me_container.dart';
import 'package:chat_app/widgets/custom_circular_indecator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages({
    super.key,
    required this.controller,
    required this.scrollController,
  });
  final TextEditingController controller;
  final ScrollController scrollController;
  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  // Future<QuerySnapshot<Object?>>? messages;
  Stream<QuerySnapshot>? messages;

  @override
  void initState() {
    messages = getMessages();
    // _scrollController = ScrollController();
    super.initState();
  }

  void dispose() {
    print("disposed called");
    widget.controller.dispose();
    super.dispose();
  }

  Stream<QuerySnapshot> getMessages() {
    return CustomFirebaseFireStore().getMessages();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: CustomFirebaseFireStore().getMessages(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = [];
          // messages!.forEach((item) {
          //   messagesList.add(MessageModel.fromJson(item));
          // });
          snapshot.data!.docs.forEach((item) {
            messagesList.add(MessageModel.fromJson(item));
          });
          return ListView.builder(
            itemCount: messagesList.length,
            controller: widget.scrollController,
            itemBuilder: (ctx, index) {
              if (messagesList[index].userID ==
                  FirebaseAuth.instance.currentUser!.uid) {
                return ChatMeContainer(message: messagesList[index].message);
              } else {
                return ChatFriendContainer(
                  message: messagesList[index].message,
                );
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
