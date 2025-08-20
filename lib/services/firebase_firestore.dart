import 'package:chat_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomFirebaseFireStore {
  CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );

  Future<void> addMessage(MessageModel message) {
    print("fire store add message");
    return messages
        .add({
          'message': message.message,
          'userID': message.userID,
          'date': message.date,
        })
        .then((value) => print("Message Added"))
        .catchError((error) => throw Exception(error.toString()));
  }

  Future<List<MessageModel>> getMessages() async {
    // return messages
    //     .orderBy('date')
    //     .get()
    //     .catchError((error) => throw Exception(error.toString()));

    try {
      List<MessageModel> messagesList = [];
      QuerySnapshot response = await messages.get();
      for (var item in response.docs) {
        messagesList.add(MessageModel.fromJson(item));
      }
      return messagesList;
    } catch (error) {
      print("error");
      throw Exception(error.toString());
      return [];
    }
  }
}
