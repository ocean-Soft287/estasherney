import 'dart:typed_data';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/register/data/models/register_model.dart';
import 'package:dartz/dartz.dart';


abstract class RegisterRepo {
  Future<Either<Failure ,RegisterResponseModel>> registerPatient({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
    required String birthday,
    required Uint8List imageBytes,
  });
}
