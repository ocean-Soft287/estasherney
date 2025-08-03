import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/data/repo/get_future_pationt_appointment/get_future_pationt_appointment_repo.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/data/model/get_future_pationt_appointment_model.dart';
import 'package:dartz/dartz.dart';


class AppointmentsPationtRepoImpl implements AppointmentsPationtRepo {
  final DioConsumer  dioConsumer;

  AppointmentsPationtRepoImpl(this.dioConsumer);

  @override
  Future<Either<Failure, AppointmentsPationtResponse>> getAllAppointments() async {
    try {
      final response = await dioConsumer.get(
      EndPoint.getallFuturepationt
      );
      final appointments = AppointmentsPationtResponse.fromJson(response);
      return Right(appointments);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
