import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/data/models/deleate_favourite_model.dart';

abstract class RemoveFavoriteDoctorState {}

class RemoveFavoriteDoctorInitial extends RemoveFavoriteDoctorState {}

class RemoveFavoriteDoctorLoading extends RemoveFavoriteDoctorState {}

class RemoveFavoriteDoctorSuccess extends RemoveFavoriteDoctorState {
  final RemoveFavoriteDoctorModel model;

  RemoveFavoriteDoctorSuccess(this.model);
}

class RemoveFavoriteDoctorFailure extends RemoveFavoriteDoctorState {
  final String message;

  RemoveFavoriteDoctorFailure(this.message);
}
