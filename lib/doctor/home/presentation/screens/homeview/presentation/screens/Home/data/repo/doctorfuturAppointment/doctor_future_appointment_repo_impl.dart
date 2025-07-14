import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/data/models/doctor_future_appointment.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/data/repo/doctorfuturAppointment/doctor_future_appointment_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DoctorFutureAppointmentRepoImpl implements DoctorFutureAppointmentRepo {
  final DioConsumer dioConsumer;

  DoctorFutureAppointmentRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, DoctorFutureAppointmentmodel>>
      getFuturedoctorAppointments() async {
    try {
      final responce = await dioConsumer.get(
        EndPoint.getDoctorFutureAppointments,
      );

      if (responce is Map<String, dynamic>) {
        final data = DoctorFutureAppointmentmodel.fromJson(responce);
        return Right(data);
      } else {
        return Left(ServerFailure('Unexpected response format'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(ServerFailure('خطأ أثناء تحميل المواعيد'));
    }
  }
}
