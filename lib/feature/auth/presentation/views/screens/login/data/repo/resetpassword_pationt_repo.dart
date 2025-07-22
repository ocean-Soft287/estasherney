import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/data/models/resetpassword_pationt_model.dart';
import 'package:dartz/dartz.dart';

abstract class ResetpasswordPationtRepo {
  Future<Either<Failure, String>> forgetPassword({
    required String email,
    required String token,
    required String newPassword,
  });
}