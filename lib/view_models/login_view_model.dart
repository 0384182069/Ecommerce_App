import 'package:ecommerce_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/toast_helper.dart';
import 'package:ecommerce_app/widgets/bottom_nav.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthMethods _authMethods = AuthMethods();
  bool _isSigningIn = false;
  User? _user;

  bool get isSigningIn => _isSigningIn;
  User? get user => _user;

  set setSigningIn(bool value) {
    _isSigningIn = value;
    notifyListeners();
  }

  Future<void> signInWithEmail({
    required String email, 
    required String password, 
    required BuildContext context,
  }) async {
    try {
      setSigningIn = true;
      notifyListeners();

      showDialog(
        context: context, 
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      
      Navigator.of(context).pop(); 
      _user = FirebaseAuth.instance.currentUser; 
      
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => const BottomNav())
      );
      
      ToastHelper.showToast("Login Successfully!", Colors.green);
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop(); 
      handleLoginError(e, context);
    } finally {
      setSigningIn = false;
      notifyListeners();
    }
  }

  void handleLoginError(FirebaseAuthException e, BuildContext context) {
    String errorMessage;
    switch (e.code) {
      case "user-not-found":
      case "wrong-password":
        errorMessage = "Wrong password or email!";
        break;
      case "invalid-credential":
        errorMessage = "Invalid credential!";
        break;
      default:
        errorMessage = "An unknown error occurred!";
    }
    ToastHelper.showToast(errorMessage, Colors.red);
  }

   Future<void> signInWithGoogle(BuildContext context) async {
    setSigningIn = true;

    UserCredential? result = await _authMethods.signInWithGoogle();

    if (result != null) {
      _user = FirebaseAuth.instance.currentUser;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNav()),
      );
      ToastHelper.showToast("Login Successfully!", Colors.green);
    } else {
      ToastHelper.showToast("Google Sign-In Failed", Colors.red);
    }
    setSigningIn = false;
  }
}
