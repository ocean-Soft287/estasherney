import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/profiledoctor/data/repo/add_rating_repo.dart';
import 'add_rating_state.dart';

class AddRatingCubit extends Cubit<AddRatingState> {
  final AddRatingRepo addRatingRepo;

  AddRatingCubit(this.addRatingRepo) : super(AddRatingInitial());

  Future<void> submitRating({
    required int doctorId,
    required int rating,
    required String comment,
  }) async {
    emit(AddRatingLoading());

    final result = await addRatingRepo.addRating(
      doctorId: doctorId,
      rating: rating,
      comment: comment,
    );

    result.fold(
      (failure) => emit(AddRatingFailure(failure.message)),
      (success) => emit(AddRatingSuccess(success.message)),
    );
  }
}
