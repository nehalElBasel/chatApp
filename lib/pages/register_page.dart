import 'package:chat_app/constants/text_constants.dart';
import 'package:chat_app/constants/theme_constant.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/widgets/custom_form_submit.dart';
import 'package:chat_app/widgets/custom_form_text.dart';
import 'package:chat_app/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static final String registerRouteID = kRegisterRoute;
  final GlobalKey<FormState> formKey = GlobalKey();
  String? _email, _password;

  _onSaveEmail(String? value) {
    _email = value;
  }

  _onSavePassword(String? value) {
    _password = value;
  }

  _onSubmit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //remove back button
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Form(
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
              Text("Sign Up"),
              SizedBox(height: 15),
              CustomFormText(label: "Email", onSaved: _onSaveEmail),
              CustomFormText(
                label: "Password",
                isPassword: true,
                onSaved: _onSavePassword,
              ),
              CustomFormSubmitBtn(title: "Sign Up", onPressed: _onSubmit),
              SizedBox(height: 10),
              CustomTextRich(
                firstText: "already have an account",
                secondText: "Login",
                onTab: () {
                  // Navigator.pushNamed(context, LoginPage.loginRouteID);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
