import 'package:consult_me/patient/doctors/presentation/view/screens/profiledoctor/data/model/get_all_rating_model.dart';

abstract class DoctorRatingAllState {}

class DoctorRatingInitial extends DoctorRatingAllState {}

class DoctorRatingAllLoading extends DoctorRatingAllState {}

class DoctorRatingAllError extends DoctorRatingAllState {
  final String message;
  DoctorRatingAllError(this.message);
}

class DoctorRatingAllSuccess extends DoctorRatingAllState {
  final DoctorAllModel success;
  DoctorRatingAllSuccess({required this.success});
}
