import 'package:consult_me/core/navigation/navigation_service.dart';
import 'package:consult_me/patient/booking/data/datasources/booking_remote_datasource.dart';
import 'package:consult_me/patient/booking/data/models/appointment_model.dart';
import 'package:consult_me/patient/booking/data/models/booking_model.dart';
import 'package:consult_me/patient/booking/data/models/confrim_payment.dart';
import 'package:consult_me/patient/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingRemoteDataSource bookingRemoteDataSource;
  BookingCubit({required this.bookingRemoteDataSource}) : super(BookingInitial());

List<DoctorAvailabilityModel>times = [];
  Future<void> getBooking({required String date,required String doctorId}) async {
    emit(BookinGtBookingAvailableLoading());
    try {
      final result = await bookingRemoteDataSource.getBookings(doctorId: doctorId, date: date);
      result.fold(
        (failure) => emit(BookingFailure(failure)),
        (success) { 
          times = success;
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

          emit(AddAppointmentSuccess(   success));
          
          },


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
        (failure) => emit(BookingFailure(failure)),
        (success) { 
          
            Fluttertoast.showToast(msg:  appointment.isPaid?   ' تم حجز الموعد بنجاح' :'لم يتم حجز الموعد بنجاح' ,toastLength: Toast.LENGTH_LONG,backgroundColor: appointment.isPaid?    Colors.green:Colors.red,textColor: Colors.white);
               emit(ConfirmPaymentSuccess(success));
               NavigationService.pushReplacement(HomeScreen());

},
      );
    } catch (e) {
      NavigationService.showToast( 'لم يتم حجز الموعد بنجاح' );
      emit(BookingFailure(e.toString()));
    }
  }
Future<void> updatePatientDeviceToken({required  int patientId,required String deviceToken }) async {
    emit(UpdatePatientDeviceTokenLoading());
    try {
      final result = await bookingRemoteDataSource.updatePatientDeviceToken(patientId: patientId, deviceToken: deviceToken);
      result.fold(
        (failure) => emit(BookingFailure(failure)),
        (success) => emit(UpdatePatientDeviceTokenSuccess(success)),
      );
    } catch (e) {
      emit(BookingFailure(e.toString()));
    }
  }
Future<void> getPatientDeviceToken({required int pateintId}) async {
    emit(GetPatientDeviceTokenLoading());
    try {
      final result = await bookingRemoteDataSource.getPatientDeviceToken(patientId: pateintId);
      result.fold(
        (failure) => emit(BookingFailure(failure)),
        (success) => emit(GetPatientDeviceTokenSuccess(success)),
      );
    } catch (e) {
      emit(BookingFailure(e.toString()));
    }
  }
}

