class Agency {
  int? agencyId;
  String name;
  String? ownerName;
  String? location;
  String? contact;
  String password;
  String? commerceRegUrl;
  String? idCardUrl;

  Agency({
    this.agencyId,
    required this.name,
    this.ownerName,
    this.location,
    this.contact,
    required this.password,
    this.commerceRegUrl,
    this.idCardUrl,
  });

  factory Agency.fromJson(Map<String, dynamic> json) {
    return Agency(
      agencyId: json['agency_id'] as int?,
      name: json['name'] as String,
      ownerName: json['owner_name'] as String?,
      location: json['location'] as String?,
      contact: json['contact'] as String?,
      password: json['password'] as String,
      commerceRegUrl: json['commerce_reg_url'] as String?,
      idCardUrl: json['id_card_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'agency_id': agencyId,
      'name': name,
      'owner_name': ownerName,
      'location': location,
      'contact': contact,
      'password': password,
      'commerce_reg_url': commerceRegUrl,
      'id_card_url': idCardUrl,
    };
  }

  Agency copyWith({
    int? agencyId,
    String? name,
    String? ownerName,
    String? location,
    String? contact,
    String? password,
    String? commerceRegUrl,
    String? idCardUrl,
  }) {
    return Agency(
      agencyId: agencyId ?? this.agencyId,
      name: name ?? this.name,
      ownerName: ownerName ?? this.ownerName,
      location: location ?? this.location,
      contact: contact ?? this.contact,
      password: password ?? this.password,
      commerceRegUrl: commerceRegUrl ?? this.commerceRegUrl,
      idCardUrl: idCardUrl ?? this.idCardUrl,
    );
  }
}
