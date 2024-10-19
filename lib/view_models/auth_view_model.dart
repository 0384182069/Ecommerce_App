import 'package:ecommerce_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/toast_helper.dart';
import 'package:ecommerce_app/widgets/bottom_nav.dart';

class AuthViewModel extends ChangeNotifier {
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
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    UserCredential? result = await _authMethods.signInWithGoogle();

    if (result != null) {
      _user = FirebaseAuth.instance.currentUser;
      Navigator.of(context).pop();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNav()),
      );
      ToastHelper.showToast("Login Successfully!", Colors.green);
    } else {
      Navigator.of(context).pop();
      ToastHelper.showToast("Google Sign-In Failed", Colors.red);
    }
    setSigningIn = false;
  }

  Future<void> registerWithEmail({
    required String email,
    required String password,
    required String username,
    required BuildContext context,
  }) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(username);
        await user.reload();
      }

      Navigator.of(context).pop();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNav()),
      );

      ToastHelper.showToast("Register Successfully!", Colors.green);
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      handleRegisterError(e, context);
    }
  }

  void handleRegisterError(FirebaseAuthException e, BuildContext context) {
    String errorMessage;
    switch (e.code) {
      case "weak-password":
        errorMessage = "Password too weak!";
        break;
      case "email-already-in-use":
        errorMessage = "Email already exists!";
        break;
      case "invalid-email":
        errorMessage = "Invalid email!";
        break;
      default:
        errorMessage = "An unknown error occurred!";
    }
    ToastHelper.showToast(errorMessage, Colors.red);
  }
}
