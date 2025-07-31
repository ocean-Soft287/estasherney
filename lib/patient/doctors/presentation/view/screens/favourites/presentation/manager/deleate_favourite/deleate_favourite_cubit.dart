import 'package:consult_me/patient/doctors/presentation/view/screens/favourites/presentation/manager/deleate_favourite/deleate_favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/favourites/data/repo/deleate_favourite_repo.dart';

class RemoveFavoriteDoctorCubit extends Cubit<RemoveFavoriteDoctorState> {
  final RemoveFavoriteDoctorRepo repo;

  RemoveFavoriteDoctorCubit(this.repo) : super(RemoveFavoriteDoctorInitial());

  Future<void> removeDoctor(int doctorId) async {
    emit(RemoveFavoriteDoctorLoading());
    final result = await repo.removeDoctorFromFavourites(doctorId);
    result.fold(
      (failure) => emit(RemoveFavoriteDoctorFailure(failure.message)),
      (model) => emit(RemoveFavoriteDoctorSuccess(model)),
    );
  }
}
