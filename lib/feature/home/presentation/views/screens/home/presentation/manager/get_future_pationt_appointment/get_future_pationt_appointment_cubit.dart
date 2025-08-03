import 'package:consult_me/feature/home/presentation/views/screens/home/data/repo/get_future_pationt_appointment/get_future_pationt_appointment_repo.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/manager/get_future_pationt_appointment/get_future_pationt_appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppointmentsPationtCubit extends Cubit<AppointmentsPationtState> {
  final AppointmentsPationtRepo appointmentsRepo;

  AppointmentsPationtCubit(this.appointmentsRepo) : super(AppointmentsPationtInitial());

  Future<void> getAllAppointments() async {
    emit(AppointmentsPationtLoading());
    final result = await appointmentsRepo.getAllAppointments();
    result.fold(
      (failure) => emit(AppointmentsPationtFailure(failure.message)),
      (response) => emit(AppointmentsPationtSuccess(response)),
    );
  }
}
