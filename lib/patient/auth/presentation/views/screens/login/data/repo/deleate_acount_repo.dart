import 'package:consult_me/patient/auth/presentation/views/screens/login/data/models/deleate_account_model.dart';
import 'package:dartz/dartz.dart';
import 'package:consult_me/core/error/fauiluire.dart';

abstract class DeleteAccountRepo {
  Future<Either<Failure, DeleteAccountModel>> deleteAccount();
}
