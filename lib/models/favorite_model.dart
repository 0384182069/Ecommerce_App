class FavoriteModel {
  final String id;
  final String name;
  final String image;
  bool isFavorite;

  FavoriteModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'isFavorite': isFavorite,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      isFavorite: map['isFavorite'] ?? false,
    );
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
