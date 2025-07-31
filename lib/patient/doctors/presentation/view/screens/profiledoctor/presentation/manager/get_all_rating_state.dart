import 'package:consult_me/patient/doctors/presentation/view/screens/profiledoctor/data/model/get_all_rating_model.dart';

abstract class DoctorRatingState {}

class DoctorRatingInitial extends DoctorRatingState {}

class DoctorRatingLoading extends DoctorRatingState {}

class DoctorRatingSuccess extends DoctorRatingState {
  final DoctorRatingModel success;

  DoctorRatingSuccess({required this.success});
}

class DoctorRatingError extends DoctorRatingState {
  final String message;

  DoctorRatingError({required this.message});
}
