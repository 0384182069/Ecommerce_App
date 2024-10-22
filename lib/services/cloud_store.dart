import 'package:cloud_firestore/cloud_firestore.dart';

class CloudStore {

  Future addUser(String userId, Map<String, dynamic> userInfoMap)async{
    return await FirebaseFirestore.instance
      .collection("User")
      .doc(userId)
      .set(userInfoMap);
  }
  
  Future<String?> getWallet(String userId) async {
  try {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
      .collection("User")
      .doc(userId)
      .get();

    if (userDoc.exists) {
      return userDoc.get('wallet').toString();
    }
  } catch (e) {
    print("Error getting wallet: $e");
  }
  return null;
  }
  Future<void> updateWallet(String userId, String newAmount) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("User")
          .doc(userId)
          .get();

      if (userDoc.exists) {
        double currentWallet = double.parse(userDoc.get('wallet').toString());
        
        double updatedWallet = currentWallet + double.parse(newAmount);
        
        // Cập nhật lại ví với số tiền mới
        await FirebaseFirestore.instance
            .collection("User")
            .doc(userId)
            .update({
          'wallet': updatedWallet.toString(),
        });
        print("Wallet updated successfully with new amount: $updatedWallet");
      }
    } catch (e) {
      print("Error updating wallet: $e");
    }
  }
}