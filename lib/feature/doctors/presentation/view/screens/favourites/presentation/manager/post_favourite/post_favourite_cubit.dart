import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/data/repo/faovourite_repo.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/presentation/manager/post_favourite/post_favourite_state.dart';

class SetFavoriteDoctorCubit extends Cubit<SetFavoriteDoctorState> {
  final SetFavoriteDoctorRepo repo;

  SetFavoriteDoctorCubit(this.repo) : super(SetFavoriteDoctorInitial());

  final Set<int> _favoriteDoctorIds = {};

  final StreamController<int> _favoriteDoctorRemovedController =
      StreamController<int>.broadcast();
  Stream<int> get favoriteDoctorRemovedStream =>
      _favoriteDoctorRemovedController.stream;

  Future<void> setFavoriteDoctors(List<int> ids) async {
    emit(SetFavoriteDoctorLoading());
    final result = await repo.setFavoriteDoctors(ids);
    result.fold((failure) => emit(SetFavoriteDoctorFailure(failure.message)), (
      data,
    ) {
      _favoriteDoctorIds.addAll(ids);
      emit(SetFavoriteDoctorSuccess(data));
    });
  }
}
