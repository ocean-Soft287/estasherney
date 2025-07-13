import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/data/models/appointment_day_model.dart';

abstract class AppointmentState {}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoading extends AppointmentState {}

class AppointmentSuccess extends AppointmentState {
  final List<AppointmentModel> appointments;

  AppointmentSuccess(this.appointments);
}

class AppointmentFailure extends AppointmentState {
  final String error;

  AppointmentFailure(this.error);
}
