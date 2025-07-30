import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/data/models/favourite_doctor_model.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/data/repo/faovourite_repo.dart';
import 'package:dartz/dartz.dart';

class SetFavoriteDoctorRepoImpl implements SetFavoriteDoctorRepo {
  final DioConsumer dioConsumer;

  SetFavoriteDoctorRepoImpl(this.dioConsumer);

  @override
  Future<Either<Failure, List<FavoriteDoctorModel>>> setFavoriteDoctors(
    List<int> doctorIds,
  ) async {
    try {

      final response = await dioConsumer.post(
        EndPoint.setFavoriteDoctors,
        data: {"doctorIds": doctorIds},
      );


      final data = response['data'];
      if (data == null || data is! List) {
        return Right([]); 
      }

      final list =
          (data)
              .map(
                (e) => FavoriteDoctorModel.fromJson(e as Map<String, dynamic>),
              )
              .toList();

      return Right(list);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

 

}
