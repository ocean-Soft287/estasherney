import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/data/models/login_pationt_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginPatientRepo {
  Future<Either<Failure, LoginPationtModel>> loginPatient({
    required String email,
    required String password,
    required bool rememberMe,
  });
}