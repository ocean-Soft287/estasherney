import 'package:consult_me/patient/doctors/presentation/view/screens/profiledoctor/data/model/doctor_rating_summary.dart';

abstract class DoctorRatingState {}

class DoctorRatingInitial extends DoctorRatingState {}

class DoctorRatingLoading extends DoctorRatingState {}

class DoctorRatingLoaded extends DoctorRatingState {
  final DoctorSummaryModel summary;

  DoctorRatingLoaded(this.summary);
}

class DoctorRatingError extends DoctorRatingState {
  final String message;

  DoctorRatingError(this.message);
}
