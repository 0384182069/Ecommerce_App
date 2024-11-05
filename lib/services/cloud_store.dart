import 'package:cloud_firestore/cloud_firestore.dart';

class CloudStore {

  Future addUser(String userId, Map<String, dynamic> userInfoMap)async{
    return await FirebaseFirestore.instance
      .collection("Users")
      .doc(userId)
      .set(userInfoMap);
  }
  
  Future<String?> getWallet(String userId) async {
  try {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
      .collection("Users")
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
  Future addFoodItem(String category,Map<String,dynamic> foodInfo)async{
    return await FirebaseFirestore.instance
      .collection(category)
      .add(foodInfo);
  }
  
  Future<void> updateWallet(String userId, String newAmount) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .get();

      if (userDoc.exists) {
        double currentWallet = double.parse(userDoc.get('wallet').toString());
        
        double updatedWallet = currentWallet + double.parse(newAmount);
        
        await FirebaseFirestore.instance
            .collection("Users")
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

  Future<bool> checkUserExists(String userId) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection('Users')
      .doc(userId)
      .get();
    return snapshot.exists; 
  }
}