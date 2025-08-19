import 'package:chat_app/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData kAppTheme = ThemeData(
  scaffoldBackgroundColor: kPrimaryColor,
  appBarTheme: AppBarTheme(backgroundColor: kPrimaryColor),
  // textTheme: GoogleFonts.pacificoTextTheme(
  //   ThemeData.light().textTheme.copyWith(
  //     // displayLarge: TextStyle(color: Colors.red),
  //     // displayMedium: TextStyle(color: Colors.green),
  //     bodyMedium: TextStyle(color: kFormTextColor, fontSize: 30),

  //     // titleMedium: TextStyle(color: Colors.deepPurple),
  //   ),
  // ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.white, fontSize: 25),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: kFormTextColor),
  ),
);

final ButtonStyle kFormSubmitStyle = ElevatedButton.styleFrom(
  backgroundColor: kFormTextColor,
  foregroundColor: kPrimaryColor,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
);

final kAppTitleStyle = GoogleFonts.pacifico();
final kTextRichStyle = TextStyle(fontSize: 20);
// final kTextRichLinkStyle = TextStyle(color: kTextRichLink, fontSize: 20);
final kTextRichLinkStyle = GoogleFonts.pacifico(
  color: kTextRichLink,
  fontSize: 20,
);

final TextStyle kFormTextFeildStyle = TextStyle(color: kFormTextColor);
