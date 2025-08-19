import 'package:chat_app/constants/theme_constant.dart';
import 'package:flutter/material.dart';

class CustomFormSubmitBtn extends StatelessWidget {
  const CustomFormSubmitBtn({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: kFormSubmitStyle,
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
