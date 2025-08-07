import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/presentation/manager/get_all_rating_state.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/profiledoctor/data/repo/get_all_rating_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorRatinAllCubit extends Cubit<DoctorRatingAllState> {
  final DoctorAllRatingRepo doctorAllRatingRepo;

  DoctorRatinAllCubit(this.doctorAllRatingRepo)
    : super(DoctorRatingInitial()) {
      
    }

  Future<void> getAllRating(int doctorId) async {
    emit(DoctorRatingAllLoading());

    final result = await doctorAllRatingRepo.getDoctorRatings(doctorId);

    result.fold(
      (failure) {
        emit(DoctorRatingAllError(failure.message));
      },
      (data) {
        emit(DoctorRatingAllSuccess(success: data));
      },
    );
  }
}
