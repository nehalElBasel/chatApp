import 'package:chat_app/cubit/sign_up_cubit/sign_up_states.dart';
import 'package:chat_app/helper.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/services/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(NoSignUpState());

  register(BuildContext context, UserModel user) async {
    emit(LoadingSignUpState());
    try {
      await CustomFireBaseAuth.register(user);
      goToChatPage(context);
      // emit(SuccessSignUp());
    } catch (e) {
      // showSnakBar(context, e.toString());
      emit(FailureSignUpState(e.toString()));
    }
  }
}
