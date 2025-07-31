import 'package:consult_me/patient/booking/data/models/appointment_model.dart';
import 'package:consult_me/patient/booking/data/models/booking_model.dart';
import 'package:consult_me/patient/booking/data/models/booking_response.dart';
import 'package:consult_me/patient/booking/data/models/confrim_payment.dart';
import 'package:dartz/dartz.dart';

abstract class BookingRepository {

Future<Either<String, List<DoctorAvailabilityModel>>> getBookings({required String doctorId,required String date });
Future<Either<String, BookingResponse>> addAppointment({required  Appointment appointment });
Future<Either<String, String>> confirmPayment({required  ConfrimPayment appointment });

}
