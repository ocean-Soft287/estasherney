import 'package:consult_me/doctor/auth/data/repo/resetpassword/resetpassword_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/doctor/auth/data/model/reset_password_model.dart';

class ResetPasswordRepoImpl implements ResetPasswordRepo {
  final DioConsumer dioConsumer;

  ResetPasswordRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, ResetPasswordModel>> resetPassword({
    required String email,
    required String token,
    required String newPassword,
  }) async {
    try {
      final result = await dioConsumer.post(
        EndPoint.resetpassworddoctor,
        data: {
          "email": email,
          "token": token,
          "newPassword": newPassword,
        },
      );

      return Right(ResetPasswordModel(message: result.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }
}
