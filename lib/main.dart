import 'package:chat_app/constants/theme_constant.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: kAppTheme,
      routes: {
        LoginPage.loginRouteID: (ctx) => LoginPage(),
        RegisterPage.registerRouteID: (ctx) => RegisterPage(),
      },
      initialRoute: LoginPage.loginRouteID,
    );
  }
}
