import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/data/model/add_rating_model.dart';
import 'package:dartz/dartz.dart';

abstract class AddRatingRepo {
  Future<Either<Failure, AddRatingModel>> addRating({
    required int doctorId,
    required int rating,
    required String comment,
  });
}
