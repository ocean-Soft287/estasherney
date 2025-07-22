import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/otp/data/model/model.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/otp/data/repo/otp_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class VerifyOtpRepoImpl implements VerifyOtpRepo {
  final DioConsumer dioHelper;

  VerifyOtpRepoImpl({required this.dioHelper});

  @override
  Future<Either<Failure, VerifyOtpResponse>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await dioHelper.post(
        EndPoint.verifyOtp,
        data: {
          'email': email,
          'otp': otp,
        },
      );

      // هنا هنتعامل مع احتمال تكون الاستجابة String مش Map
      if (response is Response) {
        final data = response.data;

        if (data is Map<String, dynamic>) {
          return Right(VerifyOtpResponse.fromJson(data));
        } else if (data is String) {
          // ممكن السيرفر يرد بجملة نجاح فقط، فنبني Response يدوي
          return Right(VerifyOtpResponse(message: data));
        } else {
          return Left(ServerFailure("Invalid response format"));
        }
      } else if (response is String) {
        // لو حصل رجوع استجابة مباشرة String
        return Right(VerifyOtpResponse(message: response));
      } else {
        return Left(ServerFailure("Unknown response type"));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Dio error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
