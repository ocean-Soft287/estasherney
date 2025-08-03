import 'package:consult_me/patient/home/presentation/views/screens/home/data/model/get_doctor_model_pationt.dart';

abstract class GetDoctorsBySpecialtyState {}

class GetDoctorsBySpecialtyInitial extends GetDoctorsBySpecialtyState {}

class GetDoctorsBySpecialtyLoading extends GetDoctorsBySpecialtyState {}

class GetDoctorsBySpecialtySuccess extends GetDoctorsBySpecialtyState {
  final List<DoctorModel> doctors;

  GetDoctorsBySpecialtySuccess({required this.doctors});
}

class GetDoctorsBySpecialtyFailure extends GetDoctorsBySpecialtyState {
  final String errorMessage;

  GetDoctorsBySpecialtyFailure({required this.errorMessage});
}
