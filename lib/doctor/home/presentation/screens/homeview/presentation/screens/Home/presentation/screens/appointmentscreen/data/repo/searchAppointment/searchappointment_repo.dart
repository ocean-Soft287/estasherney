import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/models/search_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchAppointmentRepo {
  Future<Either<Failure, List<PastAppointmentData>>> searchAppointmentsByPatientName(String name);
}
