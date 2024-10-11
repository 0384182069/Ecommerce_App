import 'package:flutter/material.dart';

class TextHelper {

  static TextStyle headerTextStyle({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle subtitleTextStyle({Color color = Colors.black38}) {
    return TextStyle(
      color: color,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle bodyTextStyle({Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }
}
