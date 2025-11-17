import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/auth/domin/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createAccountWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  //  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future addData({required UserEntity user});
  Future getUserDate({required String uid});
  Future saveUserDate({required UserEntity user});
}
