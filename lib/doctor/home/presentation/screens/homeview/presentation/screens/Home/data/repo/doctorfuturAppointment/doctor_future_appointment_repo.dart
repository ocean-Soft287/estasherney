import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/data/models/doctor_future_appointment.dart';
import 'package:dartz/dartz.dart';

abstract class DoctorFutureAppointmentRepo {
  Future<Either<Failure, List<DoctorFutureAppointmentmodel>>> getFuturedoctorAppointments();
}