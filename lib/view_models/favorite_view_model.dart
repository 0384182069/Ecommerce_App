import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/favorite_model.dart';

class FavoriteViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<FavoriteModel> _favorites = [];

  List<FavoriteModel> get favorites => _favorites;

  Future<void> loadFavorites(String userId) async {
    final snapshot = await _firestore.collection('Users').doc(userId).collection('Favorites').get();
    _favorites.clear();
    for (var doc in snapshot.docs) {
      _favorites.add(FavoriteModel.fromMap(doc.data()));
    }
    notifyListeners();
  }

  Future<void> addFavorite(FavoriteModel product, String userId) async {
    _favorites.add(product);
    await _firestore
        .collection('Users')
        .doc(userId)
        .collection('Favorites')
        .doc(product.id)
        .set(product.toMap());
    notifyListeners();
  }

  Future<void> removeFavorite(String id, String userId) async {
    _favorites.removeWhere((product) => product.id == id);
    await _firestore.collection('Users').doc(userId).collection('Favorites').doc(id).delete();
    notifyListeners();
  }

  Future<void> toggleFavorite(FavoriteModel product, String userId) async {
    product.toggleFavorite();
    if (product.isFavorite) {
      await addFavorite(product, userId);
    } else {
      await removeFavorite(product.id, userId);
    }
  }

  bool isFavorite(String id) {
    return _favorites.any((product) => product.id == id && product.isFavorite);
  }
}
