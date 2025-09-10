import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/exception.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/core/services/database_service.dart';
import 'package:e_commerce/core/services/firebase_auth_service.dart';
import 'package:e_commerce/core/services/shared_perfernces.dart';
import 'package:e_commerce/core/utiles/endpoint.dart';
import 'package:e_commerce/core/widgets/constant.dart';
import 'package:e_commerce/features/auth/data/model/user_model.dart';
import 'package:e_commerce/features/auth/domin/entity/user_entity.dart';
import 'package:e_commerce/features/auth/domin/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImp({
    required this.firebaseAuthService,
    required this.databaseService,
  });
  @override
  Future<Either<Failure, UserEntity>> createAccountWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      log("message$email");
      log("message$password");
      log(" message$name");
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(uid: user.uid, name: name, email: email);
      await addData(user: userEntity);
      return right(userEntity);
    } on Exceptions catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log("Exception in create with emailandpassword  :$e ");
      return left(ServerFailure("حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى"));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserDate(uid: user.uid);
      await saveUserDate(user: userEntity);

      return right(userEntity);
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure(e.message ?? "فشل تسجيل الدخول"));
    } catch (e, stack) {
      log("Exception in signInWithEmailAndPassword: $e", stackTrace: stack);
      return left(ServerFailure("حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log("Exception in create with log with face  :$e ");
      return left(ServerFailure("حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى"));
    }
  }

  @override
  Future addData({required UserEntity user}) async {
    await databaseService.addData(
      path: Endpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      id: user.uid,
    );
  }

  @override
  Future getUserDate({required String uid}) async {
    var userData = await databaseService.getData(
      path: Endpoint.getUserData,
      uid: uid,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserDate({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Preferences.setString(kUser, jsonData);
  }

  /*
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromJson(user));
    }  catch (e) {
      log("Exception in create with emailandpassword  :$e ");
      return left(ServerFailure("حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى"));
    }
  } */
}
