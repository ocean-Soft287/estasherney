import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/home/presentation/views/screens/dataview/data/model/get_pationt_appointment_pationt.dart';
import 'package:dartz/dartz.dart';

abstract class AppointmentsRepo {
  Future<Either<Failure, AppointmentsResponse>> getAppointments();
}
