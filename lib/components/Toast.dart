import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastHepler {
   static showSuccessRegister_Top(){
    return Fluttertoast.showToast(
        msg: "Register Successful!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.green,
        fontSize: 16.0
    );
  }
  
  static showSuccessLogin_Top(){
    return Fluttertoast.showToast(
      msg: "Login Successful!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.green,
      fontSize: 16.0
    );
  }

  static showWarningWeakPassword_Top(){
    return Fluttertoast.showToast(
      msg: "Password is too weak!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.orange,
      fontSize: 16.0
    );
  }

  static showAccountExsits_Top(){
    return Fluttertoast.showToast(
      msg: "Account already exists!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.orange,
      fontSize: 16.0
    );
  }

  static showInvalidEmail_Top(){
    return Fluttertoast.showToast(
      msg: "Invalid email!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.orange,
      fontSize: 16.0
    );
  }

  static showLoginSuccess_Top(){
    return Fluttertoast.showToast(
      msg: "Login success!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.green,
      fontSize: 16.0
    );
  }

  static showUserNotFound_Top(){
    return Fluttertoast.showToast(
      msg: "Wrong email or password",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.green,
      fontSize: 16.0
    );
  }

  static showWrongPassword_Top(){
    return Fluttertoast.showToast(
      msg: "Wrong password",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.green,
      fontSize: 16.0
    );
  }

  static showUserDisabled_Top(){
    return Fluttertoast.showToast(
      msg: "Wrong password",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.green,
      fontSize: 16.0
    );
  }
}