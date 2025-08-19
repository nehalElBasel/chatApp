import 'package:chat_app/constants/color_constants.dart';
import 'package:chat_app/constants/theme_constant.dart';
import 'package:flutter/material.dart';

class CustomFormText extends StatelessWidget {
  const CustomFormText({
    super.key,
    required this.label,
    required this.onSaved,
    this.isPassword = false,
  });
  final String label;
  final bool isPassword;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "please enter valid data";
          }
        },
        onSaved: onSaved,
        obscureText: isPassword,
        style: kFormTextFeildStyle,
        decoration: InputDecoration(
          hintText: label,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: kFormTextBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kFormTextBorderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kFormTextFocuedBorderColor),
          ),
        ),
      ),
    );
  }
}
