import 'package:consult_me/patient/auth/presentation/views/screens/otp/data/model/model.dart';
import 'package:dartz/dartz.dart';
import 'package:consult_me/core/error/fauiluire.dart';

abstract class VerifyOtpRepo {
  Future<Either<Failure, VerifyOtpResponse>> verifyOtp({
    required String email,
    required String otp,
  });
}
