import 'package:consult_me/feature/booking/data/models/booking_model.dart';

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
