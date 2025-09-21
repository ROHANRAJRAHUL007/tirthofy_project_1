import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UserModel {
  String? phone;
  String? name;
  String? id;
  String? email;

  //
  UserModel({
    this.name,
    //
    this.phone,
    this.email,
    this.id,
  });

  UserModel.fromSnapshot(DataSnapshot snap) {
    phone = (snap.value as dynamic)["phone"];
    name = (snap.value as dynamic)["phone"];
    id = (snap.value as dynamic)["phone"];
    email = (snap.value as dynamic)["phone"];
  }
}
