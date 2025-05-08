class User {
  final String email;
  final String phoneNumber;
  final String fullName;
  final String cnic;
  final String area;
  final String role;
  final String createdAt;
  final String updatedAt;
  final String accessToken;
  final String refreshToken;

  User({
    required this.email,
    required this.phoneNumber,
    required this.fullName,
    required this.cnic,
    required this.area,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.accessToken,
    required this.refreshToken,
  });

  // Factory constructor to create a User object from a JSON response
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['message']['user']['email'],
      phoneNumber: json['message']['user']['phoneNumber'],
      fullName: json['message']['user']['fullName'],
      cnic: json['message']['user']['cnic'],
      area: json['message']['user']['area'],
      role: json['message']['user']['role'],
      createdAt: json['message']['user']['createdAt'],
      updatedAt: json['message']['user']['updatedAt'],
      accessToken: json['message']['accessToken'], // Default empty if null
      refreshToken: json['message']['refreshToken'], // Default empty if null
    );
  }

  // Convert a User object to JSON for saving purposes (e.g., for SharedPreferences or API request)
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phoneNumber': phoneNumber,
      'fullName': fullName,
      'cnic': cnic,
      'area': area,
      'role': role,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}
