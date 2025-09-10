// ignore_for_file: overridden_fields

import 'package:firebase_auth/firebase_auth.dart';

class UserEntity {
  final String uid;
  final String name;
  final String email;

  UserEntity({required this.uid, required this.name, required this.email});

}

class UserData extends UserEntity {
  @override
  final String uid;

  @override
  final String email;

  @override
  final String name;

  UserData({required this.uid, required this.email, required this.name})
    : super(uid: uid, email: email, name: name);

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      uid: json["uid"] ?? "",
      email: json["email"] ?? "",
      name: json["name"] ?? "",
    );
  }

  // if you also want to map from Firebase User
  factory UserData.fromFirebaseUser(User user) {
    return UserData(
      uid: user.uid,
      email: user.email ?? "",
      name: user.displayName ?? "",
    );
  }
}
