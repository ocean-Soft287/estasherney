import 'package:consult_me/feature/home/presentation/views/screens/dataview/presentation/manger/get_pationt_appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:consult_me/feature/home/presentation/views/screens/dataview/data/repo/get_pationt_appointment_repo.dart';

class GetAppointmentsCubit extends Cubit<GetAppointmentsState> {
  final AppointmentsRepo appointmentsRepo;

  GetAppointmentsCubit(this.appointmentsRepo) : super(GetAppointmentsInitial());

  Future<void> fetchAppointments() async {
    emit(GetAppointmentsLoading());
    final result = await appointmentsRepo.getAppointments();

    result.fold(
      (failure) => emit(GetAppointmentsError(failure.message)),
      (data) => emit(GetAppointmentsSuccess(data)),
    );
  }
}
