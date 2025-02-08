class Car {
  int? carId;
  int? agencyId;
  String name;
  String brand;
  String model;
  int year;
  double pricePerDay;
  String status;
  String? imageUrl;
  String? description;

  Car({
    this.carId,
    this.agencyId,
    required this.name,
    required this.brand,
    required this.model,
    required this.year,
    required this.pricePerDay,
    this.status = 'available',
    this.imageUrl,
    this.description,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      carId: json['car_id'] as int?,
      agencyId: json['agency_id'] as int?,
      name: json['name'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      year: json['year'] as int,
      pricePerDay: (json['price_per_day'] as num).toDouble(),
      status: json['status'] as String,
      imageUrl: json['image_url'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'car_id': carId,
      'agency_id': agencyId,
      'name': name,
      'brand': brand,
      'model': model,
      'year': year,
      'price_per_day': pricePerDay,
      'status': status,
      'image_url': imageUrl,
      'description': description,
    };
  }

  Car copyWith({
    int? carId,
    int? agencyId,
    String? name,
    String? brand,
    String? model,
    int? year,
    double? pricePerDay,
    String? status,
    String? imageUrl,
    String? description,
  }) {
    return Car(
      carId: carId ?? this.carId,
      agencyId: agencyId ?? this.agencyId,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      year: year ?? this.year,
      pricePerDay: pricePerDay ?? this.pricePerDay,
      status: status ?? this.status,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
    );
  }
}
