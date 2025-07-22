import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/presentation/manager/get_all_favourite/get_all_favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/data/repo/get_all_favourite_repo.dart';

class GetAllFavouriteDoctorsCubit extends Cubit<GetAllFavouriteDoctorsState> {
  final GetAllFavouriteRepo getAllFavouriteRepo;

  GetAllFavouriteDoctorsCubit(this.getAllFavouriteRepo)
      : super(GetAllFavouriteDoctorsInitial());

  void getAllFavouriteDoctors() async {
    emit(GetAllFavouriteDoctorsLoading());
    final result = await getAllFavouriteRepo.getAllFavouriteDoctors();

    result.fold(
      (failure) => emit(GetAllFavouriteDoctorsFailure(failure.message)),
      (doctors) => emit(GetAllFavouriteDoctorsSuccess(doctors)),
    );
  }
}
