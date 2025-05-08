class RenterModel {
  final String email;
  final String phoneNumber;
  final String fullName;
  final String cnic;
  final String area;
  final String role;
  final String shopName;
  final String shopAddress;
  final String createdAt;
  final String updatedAt;
  final String accessToken;
  final String refreshToken;

  RenterModel({
    required this.email,
    required this.phoneNumber,
    required this.fullName,
    required this.cnic,
    required this.area,
    required this.role,
    required this.shopName,
    required this.shopAddress,
    required this.createdAt,
    required this.updatedAt,
    required this.accessToken,
    required this.refreshToken,
  });

  // Factory constructor to create a User object from a JSON response
  factory RenterModel.fromJson(Map<String, dynamic> json) {
    return RenterModel(
      email: json['message']['user']['email'],
      phoneNumber: json['message']['user']['phoneNumber'],
      fullName: json['message']['user']['fullName'],
      cnic: json['message']['user']['cnic'],
      area: json['message']['user']['area'],
      role: json['message']['user']['role'],
      shopName: json['message']['user']['shopName'],
      shopAddress: json['message']['user']['shopAddress'],
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
      'shopName': shopName,
      'shopAddress': shopAddress,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}
