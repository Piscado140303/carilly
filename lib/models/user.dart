class User {
  String name;
  String password;
  String phoneNumber;
  String? userUrl;

  User({
    required this.name,
    required this.password,
    required this.phoneNumber,
    this.userUrl,
  });

  // Factory constructor to convert JSON to User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      password: json['password'] as String,
      phoneNumber: json['phone_number'] as String,
      userUrl: json['user_url'] as String,
    );
  }

  // Method to convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
      'phone_number': phoneNumber,
      'user_url': userUrl,
    };
  }

  // CopyWith method to create a modified copy of the user object
  User copyWith({
    String? name,
    String? password,
    String? phoneNumber,
    String? userUrl,
  }) {
    return User(
      name: name ?? this.name,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userUrl: userUrl ?? this.userUrl,
    );
  }
}
