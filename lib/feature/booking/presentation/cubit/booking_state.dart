import 'package:consult_me/feature/booking/data/models/booking_model.dart';
import 'package:consult_me/feature/booking/data/models/booking_response.dart';

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookinGtBookingAvailableLoading extends BookingState {}

class GtBookingAvailableSuccess extends BookingState {
  List<DoctorAvailabilityModel> data;
  GtBookingAvailableSuccess(this.data);
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
