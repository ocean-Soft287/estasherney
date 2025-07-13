import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/data/models/appointment_day_model.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/data/repo/Appointmentday/appointment_day_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  final DioConsumer dio;

  AppointmentRepoImpl({required this.dio});

  @override
  Future<Either<Failure, List<AppointmentModel>>> getTodayAppointments() async {
    try {
      final response = await dio.get(EndPoint.getTodayAppointments);

      if (response is List) {
        final appointments = response
            .map((json) => AppointmentModel.fromJson(json))
            .toList()
            .cast<AppointmentModel>();
        return Right(appointments);
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
