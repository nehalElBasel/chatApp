import 'dart:developer';

import 'package:chat_app/cubit/sign_in_cubit/sigin_in_cubit.dart';
import 'package:chat_app/cubit/sign_in_cubit/sigin_in_states.dart';
import 'package:chat_app/helper.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/services/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBuilder extends StatelessWidget {
  LoginBuilder({super.key});
  String? _email, _password;
  final GlobalKey<FormState> formKey = GlobalKey();

  _onSaveEmail(String? value) {
    _email = value;
  }

  _onSavePassword(String? value) {
    _password = value;
  }

  _onSubmit(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      UserModel user = UserModel(email: _email!, password: _password!);
      BlocProvider.of<SignInCubit>(context).login(context, user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: BlocBuilder<SignInCubit, SignInStates>(
            builder: (context, state) {
              if (state is NoSignIn) {
                return LoginPage(
                  formKey: formKey,
                  onSaveEmail: _onSaveEmail,
                  onSavePassword: _onSavePassword,
                  onSubmit: () {
                    _onSubmit(context);
                  },
                );
              } else if (state is SuccessSignIn) {
                log("success state");
                Navigator.pushNamed(context, ChatPage.chatRouteID);
              } else {
                return Center(child: CircularProgressIndicator());
              }
              return Text("");
            },
          ),
        ),
      ),
    );
  }
}
