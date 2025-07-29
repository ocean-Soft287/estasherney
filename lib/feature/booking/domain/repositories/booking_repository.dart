import 'package:consult_me/feature/booking/data/models/appointment_model.dart';
import 'package:consult_me/feature/booking/data/models/booking_model.dart';
import 'package:consult_me/feature/booking/data/models/booking_response.dart';
import 'package:dartz/dartz.dart';

abstract class BookingRepository {

Future<Either<String, List<DoctorAvailabilityModel>>> getBookings({required String doctorId,required String date });
Future<Either<String, BookingResponse>> addAppointment({required  Appointment appointment });

}
