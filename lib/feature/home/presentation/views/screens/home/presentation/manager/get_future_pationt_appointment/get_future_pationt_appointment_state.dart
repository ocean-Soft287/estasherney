import 'package:consult_me/patient/home/presentation/views/screens/home/data/model/get_future_pationt_appointment_model.dart';

abstract class AppointmentsPationtState {}

class AppointmentsPationtInitial extends AppointmentsPationtState {}

class AppointmentsPationtLoading extends AppointmentsPationtState {}

class AppointmentsPationtSuccess extends AppointmentsPationtState {
  final AppointmentsPationtResponse response;

  AppointmentsPationtSuccess(this.response);
}

class AppointmentsPationtFailure extends AppointmentsPationtState {
  final String error;

  AppointmentsPationtFailure(this.error);
}
