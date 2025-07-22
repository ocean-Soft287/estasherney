import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/auth/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
    required bool rememberMe,
  });
}