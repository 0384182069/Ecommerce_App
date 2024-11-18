import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/favorite_model.dart';

class FavoriteViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final String userId;

  FavoriteViewModel({required this.userId});

  Stream<List<FavoriteModel>> get favorites {
    final favoritesRef = _firestore.collection('Users').doc(userId).collection('Favorites');
    return favoritesRef.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => FavoriteModel.fromMap(doc.data()))
          .toList();
    });
  }

  // Thêm sản phẩm vào danh sách yêu thích
  Future<void> addFavorite(FavoriteModel product) async {
    final favoriteRef = _firestore
        .collection('Users')
        .doc(userId)
        .collection('Favorites')
        .doc(product.id);

    // Kiểm tra xem sản phẩm đã có trong danh sách yêu thích chưa
    final favoriteSnapshot = await favoriteRef.get();

    if (!favoriteSnapshot.exists) {
      await favoriteRef.set(product.toMap());
    }
    notifyListeners();
  }

  // Xóa sản phẩm khỏi danh sách yêu thích
  Future<void> removeFavorite(String productId) async {
    await _firestore
        .collection('Users')
        .doc(userId)
        .collection('Favorites')
        .doc(productId)
        .delete();
    notifyListeners();
  }

  // Thay đổi trạng thái yêu thích của sản phẩm
  Future<void> toggleFavorite(FavoriteModel product) async {
    product.toggleFavorite(); 
    if (product.isFavorite) {
      await addFavorite(product);
    } else {
      await removeFavorite(product.id);
    }
  }

  Future<bool> isFavorite(String productId) {
    return _firestore
        .collection('Users')
        .doc(userId)
        .collection('Favorites')
        .doc(productId)
        .get()
        .then((snapshot) => snapshot.exists);
  }
}
