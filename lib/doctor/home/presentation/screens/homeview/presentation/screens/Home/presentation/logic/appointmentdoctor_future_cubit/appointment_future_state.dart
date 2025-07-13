import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/data/models/doctor_future_appointment.dart';

abstract class ApointmentFutureState {}

class AppointmentFutureInitial extends ApointmentFutureState {}
class AppointmentFutureLoading extends ApointmentFutureState {}
class AppointmentFutureSuccess extends ApointmentFutureState {
  final List<DoctorFutureAppointmentmodel> appointments;

  AppointmentFutureSuccess(this.appointments);
}
class AppointmentFutureFailure extends ApointmentFutureState {
  final String error;

  AppointmentFutureFailure(this.error);
}