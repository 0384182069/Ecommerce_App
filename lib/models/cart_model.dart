import 'package:ecommerce_app/models/product_model.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  double get totalPrice => product.price * quantity;

  Map<String, dynamic> toMap() {
    return {
      'productId': product.id,
      'name': product.name,
      'price': product.price,
      'quantity': quantity,
      'imageUrl': product.imageUrl,
      'totalPrice': totalPrice,
    };
  }


  factory CartItem.fromMap(Map<String, dynamic> data) {
    return CartItem(
      product: Product(
        id: data['productId'],
        name: data['name'] ?? '',
        price: data['price'] ?? 0.0,
        detail: '',
        category: '',
        imageUrl: data['imageUrl'] ?? '',
      ),
      quantity: data['quantity'] ?? 1,
    );
  }
}
