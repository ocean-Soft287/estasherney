import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/data/models/appointment_day_model.dart';
import 'package:dartz/dartz.dart';

abstract class AppointmentRepo {
  Future<Either<Failure, List<AppointmentModel>>> getTodayAppointments();
}
