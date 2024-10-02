import 'package:cloud_firestore/cloud_firestore.dart';

class CloudStore {

  Future addUser(String userId, Map<String, dynamic> userInfoMap)async{
    return await FirebaseFirestore.instance.collection("User").doc(userId).set(userInfoMap);;
  }
}