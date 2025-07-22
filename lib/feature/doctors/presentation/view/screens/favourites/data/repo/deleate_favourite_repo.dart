import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/data/models/deleate_favourite_model.dart';
import 'package:dartz/dartz.dart';

abstract class RemoveFavoriteDoctorRepo {
  Future<Either<Failure, RemoveFavoriteDoctorModel>> removeDoctorFromFavourites(int doctorId);
}
