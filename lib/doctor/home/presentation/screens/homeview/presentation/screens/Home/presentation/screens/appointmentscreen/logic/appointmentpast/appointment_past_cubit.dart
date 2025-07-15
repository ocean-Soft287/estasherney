import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/logic/appointmentpast/appointment_past_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/repo/appointpast/appointment_past_repo.dart';

class PastAppointmentCubit extends Cubit<PastAppointmentState> {
  final PastAppointmentRepo pastAppointmentRepo;

  PastAppointmentCubit(this.pastAppointmentRepo) : super(PastAppointmentInitial());

  Future<void> getPastAppointments() async {
    emit(PastAppointmentLoading());

    final result = await pastAppointmentRepo.getPastAppointments();

    result.fold(
      (failure) => emit(PastAppointmentFailure(failure.message)),
      (model) {
        final appointments = model.data;
        if (appointments.isEmpty) {
          emit(PastAppointmentFailure("لا توجد مواعيد سابقة."));
        } else {
          emit(PastAppointmentSuccess(appointments));
        }
      },
    );
  }
}
