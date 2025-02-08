class CarImage {
  int? imageId;
  int carId;
  String imageUrl;
  String? description;

  CarImage({
    this.imageId,
    required this.carId,
    required this.imageUrl,
    this.description,
  });

  factory CarImage.fromJson(Map<String, dynamic> json) {
    return CarImage(
      imageId: json['image_id'] as int?,
      carId: json['car_id'] as int,
      imageUrl: json['image_url'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_id': imageId,
      'car_id': carId,
      'image_url': imageUrl,
      'description': description,
    };
  }

  CarImage copyWith({
    int? imageId,
    int? carId,
    String? imageUrl,
    String? description,
  }) {
    return CarImage(
      imageId: imageId ?? this.imageId,
      carId: carId ?? this.carId,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
    );
  }
}
