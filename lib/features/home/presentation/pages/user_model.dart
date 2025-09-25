// lib/features/home/presentation/pages/user_model.dart

import 'package:firebase_database/firebase_database.dart';

class UserModel {
  final String uid;
  final String name;
  final String department;
  final String phone;
  final String email;

  UserModel({
    required this.uid,
    required this.name,
    required this.department,
    required this.phone,
    required this.email,
  });

  /// Create from a Firestore-like map (Map<String, dynamic>)
  factory UserModel.fromMap(Map<String, dynamic> map, String uid) {
    return UserModel(
      uid: uid,
      name: (map['name'] ?? '') as String,
      department: (map['department'] ?? '') as String,
      phone: (map['phone'] ?? '') as String,
      email: (map['email'] ?? '') as String,
    );
  }

  /// Create from a Realtime Database DataSnapshot
  /// Handles Map<dynamic, dynamic> by converting keys to String.
  factory UserModel.fromSnapshot(DataSnapshot snapshot) {
    final dynamic value = snapshot.value;

    if (value == null) {
      throw Exception(
        'Realtime Database snapshot is null for key: ${snapshot.key}',
      );
    }

    if (value is Map) {
      // Convert Map<dynamic,dynamic> -> Map<String,dynamic>
      final Map<String, dynamic> map = {};
      value.forEach((dynamic k, dynamic v) {
        map[k.toString()] = v;
      });

      final String uid = snapshot.key ?? '';
      return UserModel.fromMap(map, uid);
    } else {
      throw Exception(
        'Unexpected snapshot value type (${value.runtimeType}) for key: ${snapshot.key}',
      );
    }
  }

  /// Convert to Map<String, dynamic> (useful for Firestore or Realtime DB writes)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'department': department,
      'phone': phone,
      'email': email,
    };
  }
}
