import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/models/pastAppointment_model.dart';

abstract class PastAppointmentState {}

class PastAppointmentInitial extends PastAppointmentState {}

class PastAppointmentLoading extends PastAppointmentState {}

class PastAppointmentSuccess extends PastAppointmentState {
  final List<PastAppointmentData> appointments;

  PastAppointmentSuccess(this.appointments);
}

class PastAppointmentFailure extends PastAppointmentState {
  final String error;

  PastAppointmentFailure(this.error);
}
