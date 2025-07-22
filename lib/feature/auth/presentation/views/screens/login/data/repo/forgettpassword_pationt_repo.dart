import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/data/models/forgettpassword_pationt.dart';
import 'package:dartz/dartz.dart';

abstract class ForgetPasswordPatientRepo {
  Future<Either<Failure, ForgettpasswordPationt>> forgetPassword({
    required String email,
    required String token,
    required String newPassword,
  });
}
