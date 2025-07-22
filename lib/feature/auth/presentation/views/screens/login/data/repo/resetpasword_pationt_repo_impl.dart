import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/data/repo/resetpassword_pationt_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ResetpaswordPationtRepoImpl implements ResetpasswordPationtRepo {
  final DioConsumer dioConsumer;

  ResetpaswordPationtRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, String>> forgetPassword({
    required String email,
    required String token,
    required String newPassword,
  }) async {
    try {
      final result = await dioConsumer.post(
        EndPoint.resetPasswordpationt,
        data: {
          "email": email,
          "token": token,
          "newPassword": newPassword,
        },
      );

      if (result =="Password Changed Sucessfuly") {
        return Right(result);
      } else {
        return Left(ServerFailure("Invalid response format", 500));
      }
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode ?? 500;
      final responseData = e.response?.data;
      final errorMsg = responseData is Map<String, dynamic>
          ? responseData['message'] ?? 'Unknown server error'
          : 'Something went wrong';

      return Left(ServerFailure(errorMsg, statusCode));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }
}
