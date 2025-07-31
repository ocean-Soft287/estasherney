import 'package:consult_me/patient/home/presentation/views/screens/home/data/model/get_allspecialist.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/data/model/get_doctor_model_pationt.dart';

abstract class GetAllSpecialistState {}

class GetAllSpecialistInitial extends GetAllSpecialistState {}

class GetAllSpecialistLoading extends GetAllSpecialistState {}

class GetAllSpecialistSuccess extends GetAllSpecialistState {
  final List<GetAllspecialistModel> specialist;
  GetAllSpecialistSuccess({required this.specialist});
}

class GetAllSpecialistFailure extends GetAllSpecialistState {
  final String errorMessage;
  GetAllSpecialistFailure({required this.errorMessage});
}

class GetAllSpecialistDoctorsLoaded extends GetAllSpecialistState {
  final List<GetAllspecialistModel> specialist;
  final String selectedSpecialty;
  final List<DoctorModel> doctors;

  GetAllSpecialistDoctorsLoaded({
    required this.specialist,
    required this.selectedSpecialty,
    required this.doctors,
  });
}

class GetAllSpecialistDoctorsFailure extends GetAllSpecialistState {
  final List<GetAllspecialistModel> specialist;
  final String selectedSpecialty;
  final String errorMessage;

  GetAllSpecialistDoctorsFailure({
    required this.specialist,
    required this.selectedSpecialty,
    required this.errorMessage,
  });
}
