import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/data/models/doctor_available_request.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/data/models/post_available_request.dart';
import 'package:dartz/dartz.dart';

abstract class AddAvailabilityRepo {
  Future<Either<Failure, DoctorAvailabilityResponse>> addAvailability(
    Schedule request,
  );
}
