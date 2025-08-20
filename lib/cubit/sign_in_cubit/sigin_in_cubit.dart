import 'package:chat_app/cubit/sign_in_cubit/sigin_in_states.dart';
import 'package:chat_app/helper.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/services/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(NoSignIn());

  login(BuildContext context, UserModel user) async {
    try {
      await CustomFireBaseAuth.signIn(user);
      emit(SuccessSignIn());
    } catch (e) {
      // emit(FailureSignIn(e.toString()));
      showSnakBar(context, e.toString());
    }
  }
}
