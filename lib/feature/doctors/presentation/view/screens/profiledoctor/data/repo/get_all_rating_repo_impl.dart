import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/data/model/get_all_rating_model.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/data/repo/get_all_rating_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
class DoctorRatingRepoImpl implements DoctorAllRatingRepo {
  final DioConsumer dioConsumer;

  DoctorRatingRepoImpl(this.dioConsumer);

  @override
  Future<Either<Failure, DoctorRatingModel>> getDoctorRatings(int doctorId) async {
    try {
      final response = await dioConsumer.get("${EndPoint.getAllRatings}/$doctorId");

      if (response == null) {
        return Left(ServerFailure('فشل تحميل بيانات التقييم'));
      }
      final model = DoctorRatingModel.fromJson(response);
      return Right(model);
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
