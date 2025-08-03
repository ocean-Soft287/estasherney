import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/data/models/doctor_available_request.dart';

abstract class AddAvailabilityState {}

class AddAvailabilityInitial extends AddAvailabilityState {}

class AddAvailabilityLoading extends AddAvailabilityState {}

class AddAvailabilitySuccess extends AddAvailabilityState {
  final DoctorAvailabilityResponse response;

  AddAvailabilitySuccess(this.response);
}

class AddAvailabilityFailure extends AddAvailabilityState {
  final String error;

  AddAvailabilityFailure(this.error);
}
