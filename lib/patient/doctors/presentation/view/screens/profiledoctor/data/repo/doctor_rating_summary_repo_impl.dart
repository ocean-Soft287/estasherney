import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/profiledoctor/data/repo/doctor_rating_summary_repo.dart';
import 'package:dio/dio.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/profiledoctor/data/model/doctor_rating_summary.dart';
import 'package:dartz/dartz.dart';

class DoctorRatingRepoImpl implements DoctorRatingRepo {
  final DioConsumer dioConsumer;

  DoctorRatingRepoImpl(this.dioConsumer);

  @override
  Future<Either<Failure, DoctorSummaryModel>> fetchDoctorRating(
    int doctorId,
  ) async {
    try {
      final response = await dioConsumer.get(
        EndPoint.getDoctorRatingsummary(doctorId),
      );

      if (response != null && response['data'] != null) {
        final model = DoctorSummaryModel.fromJson(response['data']);
        return Right(model);
      } else {
        return Left(ServerFailure('فشل تحميل بيانات التقييم'));
      }
    } on DioException catch (e) {
      return Left(
        ServerFailure(e.response?.data['message'] ?? 'فشل في الاتصال بالخادم'),
      );
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }
}
