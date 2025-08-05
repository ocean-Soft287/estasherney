import 'package:consult_me/patient/booking/data/models/booking_model.dart';
import 'package:consult_me/patient/booking/data/models/booking_response.dart';

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookinGtBookingAvailableLoading extends BookingState {}

class GtBookingAvailableSuccess extends BookingState {
  List<DoctorAvailabilityModel> data;
  GtBookingAvailableSuccess(this.data);
}


class UpdatePatientDeviceTokenLoading extends BookingState{}
class UpdatePatientDeviceTokenSuccess extends BookingState{
  String data;
  UpdatePatientDeviceTokenSuccess(this.data);
}



class GetPatientDeviceTokenLoading extends BookingState{}
class GetPatientDeviceTokenSuccess extends BookingState{
  String data;
  GetPatientDeviceTokenSuccess(this.data);
}

class ConfirmPaymentLoading extends BookingState {}
class ConfirmPaymentSuccess extends BookingState {
  dynamic confirmPayment;
  ConfirmPaymentSuccess(this.confirmPayment);
}
class BookingFailure extends BookingState {
  final String error;
  BookingFailure(this.error);
}

class AddAppointmentLoading extends BookingState {}
class AddAppointmentSuccess extends BookingState {
  BookingResponse bookingResponse ;
  AddAppointmentSuccess( this. bookingResponse ); 
}
