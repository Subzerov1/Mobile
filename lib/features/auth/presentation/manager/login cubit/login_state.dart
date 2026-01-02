part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class AuthLoading extends LoginState {}

final class AuthSuccess extends LoginState {
  final UserModel user;
  AuthSuccess(this.user);
}

final class AuthFailure extends LoginState {
  final String message;
  AuthFailure(this.message);
}
