import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/presentation/logic/availabledoctor/doctor_availble_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/data/repo/availabledoctor/doctor_available_request_repo.dart';

class AddAvailabilityCubit extends Cubit<AddAvailabilityState> {
  final AddAvailabilityRepo addAvailabilityRepo;

  AddAvailabilityCubit(this.addAvailabilityRepo) : super(AddAvailabilityInitial());

  Future<void> addAvailability(DoctorAvailabilityRequest request) async {
    emit(AddAvailabilityLoading());

    final result = await addAvailabilityRepo.addAvailability(request);

    result.fold(
      (failure) => emit(AddAvailabilityFailure(failure.message)),
      (response) => emit(AddAvailabilitySuccess(response)),
    );
  }
}
