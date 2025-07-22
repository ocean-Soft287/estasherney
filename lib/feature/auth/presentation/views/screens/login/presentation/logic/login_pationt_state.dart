
import 'package:consult_me/feature/auth/presentation/views/screens/login/data/models/login_pationt_model.dart';

abstract class LoginpationtState {}

class LoginInitial extends LoginpationtState {}

class AuthLoading extends LoginpationtState {
 
}

class AuthSuccess extends LoginpationtState {
  final LoginPationtModel data;

  AuthSuccess({required this.data});
}


class AuthFailure extends LoginpationtState {
  final String message;

  AuthFailure(this.message);
}