import 'package:e_commerce/features/auth/domin/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required super.uid, required super.name, required super.email});
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json["uid"] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
    );
  }
  Map<String, dynamic> toMap() {
    return {"name": name, "email": email, "uid": uid};
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(uid: user.uid, name: user.name, email: user.email);
  }
}
