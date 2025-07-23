
import 'package:bloc/bloc.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/setting/data/repo/update_profile_repo.dart';
import 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileRepo updateProfileRepo;

  UpdateProfileCubit(this.updateProfileRepo) : super(UpdateProfileInitial());

  void updateProfile({
    required String fullname,
    required String phonenumber,
    required String birthdate,
    required String imageUrl,
  }) async {
    emit(UpdateProfileLoading());

    final result = await updateProfileRepo.updateProfile(
      fullname: fullname,
      phonenumber: phonenumber,
      birthdate: birthdate,
      imageUrl: imageUrl,
    );

    result.fold(
      (failure) => emit(UpdateProfileFailure(failure.message)),
      (model) => emit(UpdateProfileSuccess(model.message)),
    );
  }
}


