import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/models/pastAppointment_model.dart';
import 'package:dartz/dartz.dart';

abstract class PastAppointmentRepo {
  Future<Either<Failure,PastAppointmentModel>> getPastAppointments();
}
