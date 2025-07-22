import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/data/models/deleate_favourite_model.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/data/repo/deleate_favourite_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RemoveFavoriteDoctorRepoImpl implements RemoveFavoriteDoctorRepo {
  final DioConsumer dio;

  RemoveFavoriteDoctorRepoImpl(this.dio);

  @override
  Future<Either<Failure, RemoveFavoriteDoctorModel>> removeDoctorFromFavourites(int doctorId) async {
    try {
      final response = await dio.delete('${EndPoint.removeFavoriteDoctor}/$doctorId');


      final model = RemoveFavoriteDoctorModel.fromJson(response);
      return Right(model);
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
