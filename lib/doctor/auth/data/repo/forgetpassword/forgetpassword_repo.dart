import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/auth/data/model/forgetpasword_model.dart';
import 'package:dartz/dartz.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure,ForgetPasswordModel>> forgetPassword(String email);
}