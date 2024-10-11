import 'package:ecommerce_app/services/cloud_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Lấy thông tin người dùng hiện tại
  User? getCurrentUser() {
    return auth.currentUser;
  }

  // Đăng nhập bằng Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount == null) {
        // Người dùng hủy quá trình đăng nhập
        return null;
      }

      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      UserCredential userCredential = await auth.signInWithCredential(credential);

      User? userDetails = userCredential.user;

      if (userDetails != null) {
        Map<String, dynamic> userInfoMap = {
          "email": userDetails.email,
          "name": userDetails.displayName,
          "imgUrl": userDetails.photoURL,
          "id": userDetails.uid,
        };
        await CloudStore().addUser(userDetails.uid, userInfoMap);
      }

      return userCredential;
    } catch (e) {
      print('Google Sign-In Error: $e');
      return null;
    }
  }
}
