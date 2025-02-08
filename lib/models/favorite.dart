class Favorite {
  int? favoriteId;
  int userId;
  int carId;

  Favorite({
    this.favoriteId,
    required this.userId,
    required this.carId,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      favoriteId: json['favorite_id'] as int?,
      userId: json['user_id'] as int,
      carId: json['car_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'favorite_id': favoriteId,
      'user_id': userId,
      'car_id': carId,
    };
  }

  Favorite copyWith({
    int? favoriteId,
    int? userId,
    int? carId,
  }) {
    return Favorite(
      favoriteId: favoriteId ?? this.favoriteId,
      userId: userId ?? this.userId,
      carId: carId ?? this.carId,
    );
  }
}
