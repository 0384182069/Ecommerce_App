class FavoriteModel {
  final String id;
  final String name;
  bool isFavorite;

  FavoriteModel({
    required this.id,
    required this.name,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isFavorite': isFavorite,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'],
      name: map['name'],
      isFavorite: map['isFavorite'] ?? false,
    );
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
