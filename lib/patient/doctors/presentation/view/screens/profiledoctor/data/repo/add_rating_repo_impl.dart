import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/profiledoctor/data/model/add_rating_model.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/profiledoctor/data/repo/add_rating_repo.dart';
import 'package:dartz/dartz.dart';

class AddRatingRepoImpl implements AddRatingRepo {
  final DioConsumer dio;

  AddRatingRepoImpl(this.dio);
@override
Future<Either<Failure, AddRatingModel>> addRating({
  required int doctorId,
  required int rating,
  required String comment,
}) async {
  try {
    final response = await dio.post(
      EndPoint.postDoctorRating(doctorId),
      data: {
        "rating": rating,
        "comment": comment,
      },
    );

    if (response != null) {
      final model = AddRatingModel.fromJson(response);
      return Right(model);
    } else {
      return Left(ServerFailure('فشل في إرسال التقييم'));
    }
  } catch (e) {
    return Left(ServerFailure(e.toString()));
  }
}
}