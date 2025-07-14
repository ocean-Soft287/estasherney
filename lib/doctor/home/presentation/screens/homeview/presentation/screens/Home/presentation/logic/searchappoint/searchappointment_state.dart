

import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/data/models/search_model.dart';

abstract class SearchAppointmentState {}

class SearchAppointmentInitial extends SearchAppointmentState {}

class SearchAppointmentLoading extends SearchAppointmentState {}

class SearchAppointmentSuccess extends SearchAppointmentState {
  final List<PastAppointmentData> appointments;

  SearchAppointmentSuccess(this.appointments);
}


class SearchAppointmentFailure extends SearchAppointmentState {
  final String error;

  SearchAppointmentFailure(this.error);
}
