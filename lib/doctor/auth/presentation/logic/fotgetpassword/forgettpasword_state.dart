import 'package:consult_me/doctor/auth/data/model/forgetpasword_model.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPasswordModel model;

  ForgetPasswordSuccess(this.model);
}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String error;

  ForgetPasswordFailure(this.error);
}
