import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/cart_model.dart';
import 'package:ecommerce_app/utils/toast_helper.dart';
import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  late final String userId;

  CartViewModel({required this.userId});

  // Stream để lấy các sản phẩm trong giỏ hàng của người dùng
  Stream<List<CartItem>> get cartItems => getCartItems();

  // Thêm sản phẩm vào giỏ hàng
  Future<void> addItemToCart(CartItem item) async {
    final userRef = FirebaseFirestore.instance.collection('Users').doc(userId);
    final cartRef = userRef.collection('Cart'); 
    final cartItemRef = cartRef.doc(item.product.id);

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
    final userRef = FirebaseFirestore.instance.collection('Users').doc(userId);
    final cartRef = userRef.collection('Cart');
    final cartItemRef = cartRef.doc(productId);

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
    final userRef = FirebaseFirestore.instance.collection('Users').doc(userId);
    final cartRef = userRef.collection('Cart');
    final cartItemRef = cartRef.doc(productId);

    await cartItemRef.delete();
    notifyListeners();
  }

  Stream<List<CartItem>> getCartItems() {
    final userRef = FirebaseFirestore.instance.collection('Users').doc(userId);
    final cartRef = userRef.collection('Cart');
    return cartRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => CartItem.fromMap(doc.data())).toList();
    });
  }
Future<void> checkout(double totalPrice) async {
  final userRef = FirebaseFirestore.instance.collection('Users').doc(userId);
  final cartRef = userRef.collection('Cart');


  final userSnapshot = await userRef.get();
  final walletString = userSnapshot.data()?['wallet'] ?? 0.0;
  final walletBalance = double.tryParse(walletString) ?? 0.0;
  final cartSnapshot = await cartRef.get();


  if (walletBalance >= totalPrice) {
    await userRef.update({
      'wallet': (walletBalance - totalPrice).toString(),
    });

    for (var doc in cartSnapshot.docs) {
      await doc.reference.delete();
    }

    ToastHelper.showToast("Checkout Successful", Colors.green);
  } else {
    ToastHelper.showToast("Insufficient funds in wallet", Colors.red);
  }

  notifyListeners();
}
}
