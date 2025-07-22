import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/data/models/get_all_doctor_favourite.dart';
import 'package:dartz/dartz.dart';

abstract class GetAllFavouriteRepo {
  Future<Either<Failure, List<GetAllDoctorFavourite>>> getAllFavouriteDoctors();
}