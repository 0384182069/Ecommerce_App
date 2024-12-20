import 'package:flutter/material.dart';

class TextHelper {

  static TextStyle headerTextStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.w900,
      fontFamily: "Poppins",
    );
  }

  static TextStyle subtitleTextStyle() {
    return const TextStyle(
      color: Colors.grey,
      fontSize: 17,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle bodyTextStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: "Poppins",
    );
  }
}
