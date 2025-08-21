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

  Stream<QuerySnapshot> getMessages() {
    return messages.orderBy('date', descending: false).snapshots();
  }
}
