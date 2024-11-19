import 'package:cloud_firestore/cloud_firestore.dart';

class CloudStore {

  Future addUser(String userId, Map<String, dynamic> userInfoMap)async{
    return await FirebaseFirestore.instance
      .collection("Users")
      .doc(userId)
      .set(userInfoMap);
  }
  
Stream<String?> getWallet(String userId) {
  try {
    return FirebaseFirestore.instance
        .collection("Users")
        .doc(userId)
        .snapshots()
        .map((DocumentSnapshot userDoc) {
      if (userDoc.exists) {
        return userDoc.get('wallet').toString();
      }
      return null;
    });
  } catch (e) {
    print("Error getting wallet stream: $e");
    return Stream.value(null);
  }
}

  Future<void> addFoodItem(String category, Map<String, dynamic> foodInfo) async {
  DocumentReference categoryDocRef = FirebaseFirestore.instance
      .collection("Products")
      .doc();  

  
  String productId = categoryDocRef.id;

  foodInfo['id'] = productId;

  await categoryDocRef.set(foodInfo);
}

Future<void> updateFoodItem(String productId, Map<String, dynamic> updatedFoodInfo) async {
  try {
    DocumentReference productDocRef = FirebaseFirestore.instance
        .collection("Products")
        .doc(productId);

    await productDocRef.set(updatedFoodInfo, SetOptions(merge: true));
  } catch (e) {
    throw Exception('Failed to update food item: $e');
  }
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