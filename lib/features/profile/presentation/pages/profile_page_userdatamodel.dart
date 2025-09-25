class UserModel {
  final String name;
  final String department;
  final String phone;
  final String email;
  final String imageUrl;

  UserModel({
    required this.name,
    required this.department,
    required this.phone,
    required this.email,
    required this.imageUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      department: map['department'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}
