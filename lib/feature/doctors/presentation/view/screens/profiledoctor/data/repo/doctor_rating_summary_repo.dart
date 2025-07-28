import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/data/model/doctor_rating_summary.dart';
import 'package:dartz/dartz.dart';


abstract class DoctorRatingRepo {
  Future< Either<Failure, DoctorSummaryModel>> fetchDoctorRating(int doctorId);
}
