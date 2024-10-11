import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ToastHelper {
  static showToast(String message, Color backgroundColor) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: backgroundColor,
      fontSize: 16.0,
    );
  }
}
