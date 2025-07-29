import 'package:consult_me/feature/booking/data/datasources/booking_remote_datasource.dart';
import 'package:consult_me/feature/booking/data/models/appointment_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingRemoteDataSource bookingRemoteDataSource;
  BookingCubit({required this.bookingRemoteDataSource}) : super(BookingInitial());

List<String>times = [];
  Future<void> getBooking({required String date,required String doctorId}) async {
    emit(BookinGtBookingAvailableLoading());
    try {
      final result = await bookingRemoteDataSource.getBookings(doctorId: doctorId, date: date);
      result.fold(
        (failure) => emit(BookingFailure(failure)),
        (success) { 
          emit(GtBookingAvailableSuccess(success));},
      );
    } catch (e) {
      emit(BookingFailure(e.toString()));
    }
  }


  Future<void> addAppointment({required  Appointment appointment }) async {
    emit(AddAppointmentLoading());
    try {
      final result = await bookingRemoteDataSource.addAppointment(appointment: appointment);
      result.fold(
        (failure) => emit(BookingFailure(failure)),
        (success) { 
          emit(AddAppointmentSuccess(   success));},
      );
    } catch (e) {
      emit(BookingFailure(e.toString()));
    }
  }


}

