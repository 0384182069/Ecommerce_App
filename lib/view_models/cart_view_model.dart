import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/cart_model.dart';
import 'package:ecommerce_app/utils/toast_helper.dart';
import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  late final String userId;

  CartViewModel({required this.userId});


  Stream<List<CartItem>> get cartItems => getCartItems();

  Future<void> addItemToCart(CartItem item) async {
  final cartRef = FirebaseFirestore.instance.collection('Carts').doc(userId);
  final cartItemRef = cartRef.collection('Items').doc(item.product.id);

  final cartItemSnapshot = await cartItemRef.get();

  if (cartItemSnapshot.exists) {

    final data = cartItemSnapshot.data();
    final currentQuantity = data?['quantity'] ?? 0;
    final newQuantity = currentQuantity + 1;

    await cartItemRef.update({
      'quantity': newQuantity,
      'totalPrice': newQuantity * data?['price'], 
    });
  } else {

    await cartItemRef.set(item.toMap(), SetOptions(merge: true));
  }

  ToastHelper.showToast("Successfully Added To Cart", Colors.green);
  notifyListeners(); 
}


  Future<void> updateQuantity(String productId, bool isIncrement) async {
    final cartRef = FirebaseFirestore.instance.collection('Carts').doc(userId);
    final cartItemRef = cartRef.collection('Items').doc(productId);

    final cartItemSnapshot = await cartItemRef.get();
    if (cartItemSnapshot.exists) {
      final data = cartItemSnapshot.data();
      final currentQuantity = data?['quantity'] ?? 0;
      final newQuantity = isIncrement ? currentQuantity + 1 : currentQuantity - 1;


      if (newQuantity <= 0) {
        await cartItemRef.delete();
      } else {
        
        await cartItemRef.update({
          'quantity': newQuantity,
          'totalPrice': newQuantity * data?['price'], 
        });
      }
      notifyListeners();
    }
  }

  Future<void> removeItem(String productId) async {
    final cartRef = FirebaseFirestore.instance.collection('Carts').doc(userId);
    final cartItemRef = cartRef.collection('Items').doc(productId);

    await cartItemRef.delete();
    notifyListeners();
  }

  Stream<List<CartItem>> getCartItems() {
    final cartRef = FirebaseFirestore.instance.collection('Carts').doc(userId);
    return cartRef.collection('Items').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => CartItem.fromMap(doc.data())).toList();
    });
  }
}
