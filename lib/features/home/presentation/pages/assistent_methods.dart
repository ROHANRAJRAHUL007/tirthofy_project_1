import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/home/presentation/pages/user_model.dart';
import 'package:tirthofy_code_1/features/service/widgets/global.dart';

class AssistentMethods {
  static void readCurrentOnLineUserInfo() async {
    currentUsser = firebaseAuth.currentUser;
    DatabaseReference userRef = FirebaseDatabase.instance
        .ref()
        .child("user")
        .child(currentUsser!.uid);

    userRef.once().then((snap) {
      if (snap.snapshot.value != null) {
        userModelCurrentInfo = UserModel.fromSnapshot(snap.snapshot);
      }
    });
  }
}
