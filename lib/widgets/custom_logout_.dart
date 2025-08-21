import 'package:chat_app/helper.dart';
import 'package:chat_app/pages/login_builder.dart';
import 'package:chat_app/services/firebase_auth.dart';
import 'package:chat_app/widgets/custom_circular_indecator.dart';
import 'package:flutter/material.dart';

class CustomLogOut extends StatefulWidget {
  const CustomLogOut({super.key});

  @override
  State<CustomLogOut> createState() => _CustomLogOutState();
}

class _CustomLogOutState extends State<CustomLogOut> {
  bool _isLoading = false;

  _logout(BuildContext context) async {
    try {
      _isLoading = true;
      setState(() {});
      await CustomFireBaseAuth.signOut();
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginBuilder.loginRouteID,
        (route) => false,
      );
    } catch (error) {
      showSnakBar(context, error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = IconButton(
      onPressed: () async {
        await _logout(context);
      },
      icon: Icon(Icons.logout),
    );

    return _isLoading ? CustomCircularIndecator() : content;
  }
}
