import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/data/models/forgettpassword_pationt.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/data/repo/forgettpassword_pationt_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ForgetpasswordRepoImpl  implements ForgetPasswordPatientRepo {
  final DioConsumer dioConsumer;

  ForgetpasswordRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, ForgettpasswordPationt>> forgetPassword({
    required String email,
    required String newPassword,
    required String token,
  }) async {
    try {
      final response = await dioConsumer.post(
        EndPoint.forgetpasswordpation,
        data: {
          'email': email,
          'newPassword': newPassword,
          'token': token,
        },
      );
      return Right(ForgettpasswordPationt.fromJson(response));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'An unexpected error occurred'));
    }
  }
}
