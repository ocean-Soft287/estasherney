import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/auth/data/model/forgetpasword_model.dart';
import 'package:consult_me/doctor/auth/data/repo/forgetpassword/forgetpassword_repo.dart';
import 'package:dartz/dartz.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final DioConsumer dioConsumer;

  ForgetPasswordRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(String email) async {
    try {
      final result = await dioConsumer.post(
        EndPoint.forgetpassworddoctor,
        data: {"email": email},
      );

   
      return Right(ForgetPasswordModel(message: result.toString())); 
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }
}
