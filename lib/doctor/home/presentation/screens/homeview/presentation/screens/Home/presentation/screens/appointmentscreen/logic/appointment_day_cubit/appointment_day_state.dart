import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/models/appointment_day_model.dart';

abstract class AppointmentState {}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoading extends AppointmentState {}

class AppointmentSuccess extends AppointmentState {
  final AppointmentModel model;
  AppointmentSuccess(this.model);
}

class AppointmentFailure extends AppointmentState {
  final String message;
  AppointmentFailure(this.message);
}
