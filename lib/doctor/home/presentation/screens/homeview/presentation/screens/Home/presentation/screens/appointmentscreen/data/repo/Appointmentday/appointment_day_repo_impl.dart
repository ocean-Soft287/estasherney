import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/models/appointment_day_model.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/repo/Appointmentday/appointment_day_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  final DioConsumer dio;

  AppointmentRepoImpl({required this.dio});

  @override
  Future<Either<Failure, AppointmentModel>> getTodayAppointments() async {
    try {
      final response = await dio.get(EndPoint.getTodayAppointments);

     
      print("API Response: $response");

      if (response is Map<String, dynamic>) {
        final model = AppointmentModel.fromJson(response);
        return Right(model);
      } else {
        return Left(ServerFailure('تنسيق غير متوقع من السيرفر'));
      }
    } on DioException catch (e) {
      print("Dio Error: ${e.message}");
      return Left(ServerFailure(e.message ?? 'حدث خطأ غير متوقع'));
    } catch (e) {
      print("General Error: $e");
      return Left(ServerFailure('حدث خطأ أثناء تحميل المواعيد'));
    }
  }
}
