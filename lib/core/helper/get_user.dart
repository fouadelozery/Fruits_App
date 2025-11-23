import 'dart:convert';

import 'package:e_commerce/core/services/shared_perfernces.dart';
import 'package:e_commerce/core/widgets/constant.dart';
import 'package:e_commerce/features/auth/data/model/user_model.dart';
import 'package:e_commerce/features/auth/domin/entity/user_entity.dart';

UserEntity getUserData() {
  var jsonString = Preferences.getString(kUser);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString!));
  return userEntity;
}
