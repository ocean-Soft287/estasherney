import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/models/doctor_future_appointment.dart';

abstract class ApointmentFutureState {}

class AppointmentFutureInitial extends ApointmentFutureState {}

class AppointmentFutureLoading extends ApointmentFutureState {}

class AppointmentFutureSuccess extends ApointmentFutureState {
  final DoctorFutureAppointmentmodel model;

  AppointmentFutureSuccess(this.model);
}

class AppointmentFutureFailure extends ApointmentFutureState {
  final String message;

  AppointmentFutureFailure(this.message);
}
