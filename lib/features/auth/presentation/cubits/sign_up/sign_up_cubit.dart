import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/auth/domin/entity/user_entity.dart';
import 'package:e_commerce/features/auth/domin/repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> signUp({required String email, required String password,required String name}) async {
    emit(SignUpLoading());
    final result = await authRepo.createAccountWithEmailAndPassword(
      email,
      password,
      name,
    );
    result.fold(
      (failure) => emit(SignUpFailure(errorMessage: failure.message)),
      (user) => emit(SignUpSuccess(userEntity: user)),
    );
  }
}
