import 'package:chat_app/constants/theme_constant.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_builder.dart';
import 'package:chat_app/pages/register_builder.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: kAppTheme,
      routes: {
        LoginBuilder.loginRouteID: (ctx) => LoginBuilder(),
        RegisterBuilder.registerRouteID: (ctx) => RegisterBuilder(),
        ChatPage.chatRouteID: (context) => ChatPage(),
      },
      initialRoute: LoginBuilder.loginRouteID,
    );
  }
}
