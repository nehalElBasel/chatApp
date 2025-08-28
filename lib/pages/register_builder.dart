import 'package:chat_app/constants/text_constants.dart';
import 'package:chat_app/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:chat_app/cubit/sign_up_cubit/sign_up_states.dart';
import 'package:chat_app/helper.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/custom_circular_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBuilder extends StatelessWidget {
  RegisterBuilder({super.key});
  static final String registerRouteID = kRegisterRoute;

  final GlobalKey<FormState> formKey = GlobalKey();
  String? _email, _password;

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
      BlocProvider.of<SignUpCubit>(context).register(context, user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //remove back button
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: BlocConsumer<SignUpCubit, SignUpStates>(
            builder: (context, state) {
              if (state is LoadingSignUpState) {
                return CustomCircularIndecator();
              } else {
                return RegisterPage(
                  formKey: formKey,
                  onSaveEmail: _onSaveEmail,
                  onSavePassword: _onSavePassword,
                  onSubmit: () {
                    _onSubmit(context);
                  },
                );
              }
            },
            listener: (context, state) {
              if (state is FailureSignUpState) {
                showSnakBar(context, state.message);
              }
            },
          ),
        ),
      ),
    );
  }
}
