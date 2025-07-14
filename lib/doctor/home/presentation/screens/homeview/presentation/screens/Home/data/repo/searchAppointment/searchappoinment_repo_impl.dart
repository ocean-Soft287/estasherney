import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/data/models/search_model.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/data/repo/searchAppointment/searchappointment_repo.dart';
import 'package:dartz/dartz.dart';

class SearchAppointmentRepoImpl implements SearchAppointmentRepo {
  final DioConsumer dio;

  SearchAppointmentRepoImpl({required this.dio});

  @override
  Future<Either<Failure, List<PastAppointmentData>>> searchAppointmentsByPatientName(String name) async {
    try {
      final response = await dio.get(
        "${EndPoint.searchPatient}?patientName=$name",
      );

      if (response is Map<String, dynamic> && response.containsKey("data")) {
        final model = SearchAppointmentModel.fromJson(response);
        return Right(model.data); 
      } else {
        return Left(ServerFailure("بيانات غير متوقعة من السيرفر"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
