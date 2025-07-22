import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/data/model/get_doctor_model_pationt.dart';
import 'package:dartz/dartz.dart';

abstract class GetDoctorsBySpecialtyRepo {
  Future< Either<Failure, List<DoctorModel>>> getDoctorsBySpecialty(String specialty);
}
