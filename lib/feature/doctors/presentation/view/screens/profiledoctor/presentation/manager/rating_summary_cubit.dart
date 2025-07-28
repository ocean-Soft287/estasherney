import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/presentation/manager/rating_summary_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/data/repo/doctor_rating_summary_repo.dart';

class DoctorRatingCubit extends Cubit<DoctorRatingState> {
  final DoctorRatingRepo repo;

  DoctorRatingCubit(this.repo) : super(DoctorRatingInitial());

  Future<void> getDoctorRating(int doctorId) async {
    emit(DoctorRatingLoading());

    final result = await repo.fetchDoctorRating(doctorId);

    result.fold(
      (failure) => emit(DoctorRatingError(failure.message)),
      (summary) => emit(DoctorRatingLoaded(summary)),
    );
  }
}
