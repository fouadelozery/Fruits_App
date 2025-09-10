import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/auth/domin/entity/user_entity.dart';
import 'package:e_commerce/features/auth/domin/repo/auth_repo.dart';
import 'package:flutter/foundation.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> signIn(String email, String password) async {
    emit(LoginLoading());
    var result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.message)),
      (user) => emit(LoginSucces(userEntity: user)),
    );
  }
  /*
  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.message)),
      (user) => emit(LoginSucces(userEntity: user)),
    );
  }
  */

  Future<void> signInWithFacebook() async {
    emit(LoginLoading());
    var result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.message)),
      (user) => emit(LoginSucces(userEntity: user)),
    );
  }
}
