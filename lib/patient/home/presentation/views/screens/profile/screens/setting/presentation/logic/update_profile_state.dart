import 'package:consult_me/patient/home/presentation/views/screens/profile/screens/setting/data/models/get_profile_model.dart';

abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final String message;

  UpdateProfileSuccess(this.message);
}

class ProfileFailure extends UpdateProfileState {
  final String errorMessage;

  ProfileFailure(this.errorMessage);
}


class GetProfileLoading extends UpdateProfileState {}

class GetProfileSuccess extends UpdateProfileState {
  final GetProfileModel model;

  GetProfileSuccess(this.model);
}

