import 'package:dartz/dartz.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/auth/data/model/reset_password_model.dart';

abstract class ResetPasswordRepo {
  Future<Either<Failure, ResetPasswordModel>> resetPassword({
    required String email,
    required String token,
    required String newPassword,
  });
}
