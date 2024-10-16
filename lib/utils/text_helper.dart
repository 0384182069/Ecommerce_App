import 'package:flutter/material.dart';

class TextHelper {

  static TextStyle headerTextStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle subtitleTextStyle() {
    return const TextStyle(
      color: Colors.grey,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle bodyTextStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w800,
      fontFamily: "Poppins",
    );
  }
}
