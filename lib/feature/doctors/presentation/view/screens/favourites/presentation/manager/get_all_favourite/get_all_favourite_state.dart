import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/data/models/get_all_doctor_favourite.dart';

abstract class GetAllFavouriteDoctorsState {}

class GetAllFavouriteDoctorsInitial extends GetAllFavouriteDoctorsState {}

class GetAllFavouriteDoctorsLoading extends GetAllFavouriteDoctorsState {}

class GetAllFavouriteDoctorsSuccess extends GetAllFavouriteDoctorsState {
  final List<GetAllDoctorFavourite> doctors;

  GetAllFavouriteDoctorsSuccess(this.doctors);
}

class GetAllFavouriteDoctorsFailure extends GetAllFavouriteDoctorsState {
  final String message;

  GetAllFavouriteDoctorsFailure(this.message);
}
