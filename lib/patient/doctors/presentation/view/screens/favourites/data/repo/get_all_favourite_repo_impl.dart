import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/favourites/data/models/get_all_doctor_favourite.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/favourites/data/repo/get_all_favourite_repo.dart';
import 'package:dartz/dartz.dart';

class GetAllFavouriteRepoImpl implements GetAllFavouriteRepo {
  final DioConsumer dioConsumer;

  GetAllFavouriteRepoImpl(this.dioConsumer);

  @override
  Future<Either<Failure, List<GetAllDoctorFavourite>>> getAllFavouriteDoctors() async {
    try {
      final response = await dioConsumer.get(EndPoint.getFavoriteDoctors); 
      final List<dynamic> doctorsJson = response['favoriteDoctors'] ?? [];

      final List<GetAllDoctorFavourite> doctors = doctorsJson
          .map((json) => GetAllDoctorFavourite.fromJson(json))
          .toList();

      return Right(doctors);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
