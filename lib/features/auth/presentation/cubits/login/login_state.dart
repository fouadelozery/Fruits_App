part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState{}
final class LoginSucces extends LoginState{
    final UserEntity userEntity;

  LoginSucces({required this.userEntity});


}
final class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}
