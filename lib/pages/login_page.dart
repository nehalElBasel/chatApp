import 'package:chat_app/constants/color_constants.dart';
import 'package:chat_app/constants/text_constants.dart';
import 'package:chat_app/constants/theme_constant.dart';
import 'package:chat_app/cubit/sign_in_cubit/sigin_in_cubit.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/custom_form_submit.dart';
import 'package:chat_app/widgets/custom_form_text.dart';
import 'package:chat_app/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    super.key,
    required this.formKey,
    required this.onSaveEmail,
    required this.onSavePassword,
    required this.onSubmit,
  });
  static final String loginRouteID = kLoginRoute;
  final void Function(String?)? onSaveEmail, onSavePassword;
  final void Function() onSubmit;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          Image.asset(kLogoImage, width: 100, height: 100),
          Text(
            "schoolar app",
            textAlign: TextAlign.center,
            style: kAppTitleStyle,
          ),
          SizedBox(height: 20),
          Text("Sign in"),
          SizedBox(height: 15),
          CustomFormText(label: "Email", onSaved: onSaveEmail),
          CustomFormText(
            label: "Password",
            isPassword: true,
            onSaved: onSavePassword,
          ),
          CustomFormSubmitBtn(title: "SignIn", onPressed: onSubmit),
          SizedBox(height: 10),
          CustomTextRich(
            firstText: "don't have an account",
            secondText: "Register",
            onTab: () {
              Navigator.pushNamed(context, RegisterPage.registerRouteID);
            },
          ),
        ],
      ),
    );
  }
}
