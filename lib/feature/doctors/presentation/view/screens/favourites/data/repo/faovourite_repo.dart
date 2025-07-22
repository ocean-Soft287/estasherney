import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/data/models/favourite_doctor_model.dart';
import 'package:dartz/dartz.dart';
abstract class SetFavoriteDoctorRepo {
  Future<Either<Failure, List<FavoriteDoctorModel>>> setFavoriteDoctors(List<int> doctorIds);

  
 
}


