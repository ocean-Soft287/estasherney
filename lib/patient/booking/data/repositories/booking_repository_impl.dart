import 'package:consult_me/patient/booking/data/models/appointment_model.dart';
import 'package:consult_me/patient/booking/data/models/booking_model.dart';
import 'package:consult_me/patient/booking/data/models/booking_response.dart';
import 'package:consult_me/patient/booking/data/models/confrim_payment.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/booking_repository.dart';
import '../datasources/booking_remote_datasource.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remoteDataSource;

  BookingRepositoryImpl(this.remoteDataSource);

  
  @override
  Future<Either<String, List<DoctorAvailabilityModel>>> getBookings({required String doctorId, required String date}) {
    return remoteDataSource.getBookings(doctorId: doctorId, date: date);
  }

  @override
  Future<Either<String, BookingResponse>> addAppointment({required Appointment appointment}) {
    return remoteDataSource.addAppointment(appointment: appointment); 
  }

  @override
  Future<Either<String, String>> confirmPayment({required ConfrimPayment appointment}) {

    return remoteDataSource.confirmPayment(appointment: appointment); 
  }



}
