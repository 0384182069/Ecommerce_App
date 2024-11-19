class Product {
  final String id;
  final String name;
  final double price;
  final String detail;
  final String category;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.detail,
    required this.category,
    required this.imageUrl,
  });

   Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'detail': detail,
      'category': category,
      'imageUrl': imageUrl,
    };
  }
  // Phương thức từ Map để tạo instance Product
  factory Product.fromMap(Map<String, dynamic> data, String documentId) {
    return Product(
      id: documentId,
      name: data['name'] ?? '',
      detail: data['detail'] ?? '',
      category: data['category'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      price: data['price'] is String
          ? double.tryParse(data['price']) ?? 0.0
          : (data['price'] as num).toDouble(),
    );
  }

}
