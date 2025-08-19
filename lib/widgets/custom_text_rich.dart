import 'package:chat_app/constants/theme_constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onTab,
  });
  final String firstText, secondText;
  final void Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: firstText,
        style: kTextRichStyle,
        children: [
          const TextSpan(text: " "),
          TextSpan(
            text: secondText,
            style: kTextRichLinkStyle,
            recognizer: TapGestureRecognizer()..onTap = onTab,
          ),
        ],
      ),
    );
  }
}
