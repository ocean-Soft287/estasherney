import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/data/model/get_all_rating_model.dart';
import 'package:dartz/dartz.dart';

abstract class DoctorAllRatingRepo {
  Future<Either<Failure, DoctorAllModel>> getDoctorRatings(int doctorId);
}
