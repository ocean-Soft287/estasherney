import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/data/model/get_future_pationt_appointment_model.dart';
import 'package:dartz/dartz.dart';

abstract class AppointmentsPationtRepo {
  Future<Either<Failure, AppointmentsPationtResponse>> getAllAppointments();
}
