import 'package:consult_me/doctor/auth/data/model/login_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class AuthLoading extends LoginState {}

class AuthSuccess extends LoginState {
  final LoginModel data;

  AuthSuccess({required this.data});
}


class AuthFailure extends LoginState {
  final String message;

  AuthFailure(this.message);
}