import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/home/presentation/views/screens/dataview/data/model/get_pationt_appointment_pationt.dart';
import 'package:consult_me/feature/home/presentation/views/screens/dataview/data/repo/get_pationt_appointment_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
class AppointmentsRepoImpl implements AppointmentsRepo {
  final DioConsumer dioConsumer;

  AppointmentsRepoImpl(this.dioConsumer);

  @override
  Future<Either<Failure, AppointmentsResponse>> getAppointments() async {
    try {
      final response = await dioConsumer.get(EndPoint.getallPationtAppointment);

     

      final appointments = AppointmentsResponse.fromJson(response);

      return Right(appointments);
    } on DioException catch (e) {
      
      return Left(
        ServerFailure(e.response?.data['message'] ?? 'فشل في الاتصال بالخادم'),
      );
    } catch (e) {
      
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }
}
