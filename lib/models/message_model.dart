import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String userID;
  final DateTime date;
  MessageModel({
    required this.userID,
    required this.message,
    required this.date,
  });

  factory MessageModel.fromJson(dynamic data) {
    Timestamp ts = data['date'];
    return MessageModel(
      userID: data['userID'],
      message: data['message'],
      date: ts.toDate(),
    );
  }
}
