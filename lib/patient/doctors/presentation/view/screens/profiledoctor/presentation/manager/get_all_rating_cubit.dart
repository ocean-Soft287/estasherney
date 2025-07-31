import 'package:consult_me/patient/doctors/presentation/view/screens/profiledoctor/data/repo/get_all_rating_repo.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/profiledoctor/presentation/manager/get_all_rating_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class DoctorRatingCubit extends Cubit<DoctorRatingState> {
  final DoctorAllRatingRepo doctorRatingRepo;

  DoctorRatingCubit(this.doctorRatingRepo) : super(DoctorRatingInitial());

  Future<void> fetchDoctorRating(int doctorId) async {
    emit(DoctorRatingLoading());
    final result = await doctorRatingRepo.getDoctorRatings(doctorId);
    result.fold(
      (failure) => emit(DoctorRatingError(message: failure.message)),
      (rating) => emit(DoctorRatingSuccess(success: rating)), 
    );
  }
}
