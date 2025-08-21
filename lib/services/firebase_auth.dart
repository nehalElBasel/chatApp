import 'dart:developer';

import 'package:chat_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomFireBaseAuth {
  static String UserID =
      FirebaseAuth.instance.currentUser != null
          ? FirebaseAuth.instance.currentUser!.uid
          : "";

  static String userName =
      FirebaseAuth.instance.currentUser != null
          ? FirebaseAuth.instance.currentUser!.email!
          : "Guest";
  static Future<void> register(UserModel user) async {
    log("register fireauth");
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password,
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception("The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        throw Exception("The account already exists for that email.");
      } else {
        throw Exception(e.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> signIn(UserModel user) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-credential") {
        throw Exception("invalid-credential");
      } else if (e.code == 'user-not-found') {
        throw Exception("No user found for that email");
      } else if (e.code == 'wrong-password') {
        throw Exception("Wrong password provided for that user");
      } else {
        throw Exception(e.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
