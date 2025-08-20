import 'dart:developer';

import 'package:chat_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomFireBaseAuth {
  static Future<void> register(UserModel user) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password,
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        throw Exception("The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        throw Exception("The account already exists for that email.");
      }
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  static Future<void> signIn(UserModel user) async {
    log("signin in firebase");
    log(user.email);
    log(user.password);
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      print("credential");
      print(credential.user?.email);
    } on FirebaseAuthException catch (e) {
      print("here catch issue sign innn FirebaseAuthException");
      // print(e.code);
      if (e.code == "invalid-credential") {
        print("invalid-credential");
        throw Exception("invalid-credential");
      } else if (e.code == 'user-not-found') {
        print('No user found for that email.');
        throw Exception("No user found for that email");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        throw Exception("Wrong password provided for that user");
      } else {
        throw Exception("other issue");
        throw Exception(e.toString());
      }
    } catch (e) {
      print("here catch issue sign innn");
      throw Exception(e.toString());
    }
  }
}
