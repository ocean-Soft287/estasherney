import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/data/models/deleate_account_model.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/data/repo/deleate_acount_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DeleteAccountRepoImpl implements DeleteAccountRepo {
  final DioConsumer dio;

  DeleteAccountRepoImpl(this.dio);

  @override
  Future<Either<Failure, DeleteAccountModel>> deleteAccount() async {
    try {
      final response = await dio.delete(
        EndPoint.deleteAccount,
      );
      if (response.statusCode != 200) {
        return Left(ServerFailure("Failed to delete account"));
      }

      final message = response.toString().trim();

      if (message.contains("Patient Account Deleted Successfully")) {
        return Right(DeleteAccountModel(message: message));
      } else {
        return Left(ServerFailure("Unexpected response: $message"));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
