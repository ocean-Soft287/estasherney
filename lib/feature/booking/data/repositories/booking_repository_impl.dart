import 'package:consult_me/feature/booking/data/models/booking_model.dart';
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

}
