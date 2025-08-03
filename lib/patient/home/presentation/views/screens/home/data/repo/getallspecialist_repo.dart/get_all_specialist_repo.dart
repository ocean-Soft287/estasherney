import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/data/model/get_allspecialist.dart';
import 'package:dartz/dartz.dart';

abstract class GetAllSpecialistRepo {
  Future<Either<Failure, List<GetAllspecialistModel>>> getAllSpecialists();
}