import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/models/pastAppointment_model.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/repo/appointpast/appointment_past_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AppointmentPastRepoImpl implements PastAppointmentRepo {
  final DioConsumer dioConsumer;

  AppointmentPastRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, PastAppointmentModel>> getPastAppointments() async {
    try {
      final response = await dioConsumer.get(
       EndPoint.getDoctorPastAppointments,
      );

      final model = PastAppointmentModel.fromJson(response);
      return Right(model);
    } on DioException catch (e) {
      return Left(ServerFailure(
        e.response?.data["message"] ?? "حدث خطأ ما",
        e.response?.statusCode ?? 500,
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString(), 500));
    }
  }
}
