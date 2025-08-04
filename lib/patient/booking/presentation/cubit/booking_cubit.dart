import 'package:consult_me/core/navigation/navigation_service.dart';
import 'package:consult_me/patient/booking/data/datasources/booking_remote_datasource.dart';
import 'package:consult_me/patient/booking/data/models/appointment_model.dart';
import 'package:consult_me/patient/booking/data/models/confrim_payment.dart';
import 'package:consult_me/patient/home/home_screen.dart';
import 'package:flutter/material.dart';
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
          debugPrint("+++++++++++++++++++++");
          debugPrint(success.appointmentId.toString());
          debugPrint("+++++++++++++++++++++");

          emit(AddAppointmentSuccess(   success));},

      );
    } catch (e) {
      emit(BookingFailure(e.toString()));
    }
  }

Future<void> confirmPayment({required ConfrimPayment appointment}) async {
    emit(ConfirmPaymentLoading());
    try {
      final result = await bookingRemoteDataSource.confirmPayment(appointment: appointment);
      result.fold(
        (failure){
           NavigationService.showToast
(failure,  false); 
          emit(BookingFailure(failure)); },
        (success) { 

           NavigationService.showToast("تم الدفع بنجاح",  false); 
           emit(ConfirmPaymentSuccess(success));
           NavigationService.push(HomeScreen());
}
      );
    } catch (e) {
      NavigationService.showToast
("حدث خطآ",  false); 
      emit(BookingFailure(e.toString()));
    }
  }
}

