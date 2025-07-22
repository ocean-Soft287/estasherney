
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/data/models/favourite_doctor_model.dart';

abstract class SetFavoriteDoctorState {}

class SetFavoriteDoctorInitial extends SetFavoriteDoctorState {}

class SetFavoriteDoctorLoading extends SetFavoriteDoctorState {}

class SetFavoriteDoctorSuccess extends SetFavoriteDoctorState {
  final List<FavoriteDoctorModel> favoriteDoctors;

  SetFavoriteDoctorSuccess(this.favoriteDoctors);
}

class SetFavoriteDoctorFailure extends SetFavoriteDoctorState {
  final String message;

  SetFavoriteDoctorFailure(this.message);
}
