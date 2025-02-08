class RentalRequest {
  int? requestId;
  int userId;
  int carId;
  String startDate;
  String endDate;
  String status;

  RentalRequest({
    this.requestId,
    required this.userId,
    required this.carId,
    required this.startDate,
    required this.endDate,
    this.status = 'pending',
  });

  factory RentalRequest.fromJson(Map<String, dynamic> json) {
    return RentalRequest(
      requestId: json['request_id'] as int?,
      userId: json['user_id'] as int,
      carId: json['car_id'] as int,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'request_id': requestId,
      'user_id': userId,
      'car_id': carId,
      'start_date': startDate,
      'end_date': endDate,
      'status': status,
    };
  }

  RentalRequest copyWith({
    int? requestId,
    int? userId,
    int? carId,
    String? startDate,
    String? endDate,
    String? status,
  }) {
    return RentalRequest(
      requestId: requestId ?? this.requestId,
      userId: userId ?? this.userId,
      carId: carId ?? this.carId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
    );
  }
}
