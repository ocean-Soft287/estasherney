import 'package:consult_me/feature/home/presentation/views/screens/dataview/data/model/get_pationt_appointment_pationt.dart';

abstract class GetAppointmentsState {}

class GetAppointmentsInitial extends GetAppointmentsState {}

class GetAppointmentsLoading extends GetAppointmentsState {}

class GetAppointmentsSuccess extends GetAppointmentsState {
  final AppointmentsResponse appointments;

  GetAppointmentsSuccess(this.appointments);
}

class GetAppointmentsError extends GetAppointmentsState {
  final String message;

  GetAppointmentsError(this.message);
}
