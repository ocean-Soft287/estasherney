import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/repo/doctorfuturAppointment/doctor_future_appointment_repo.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/logic/appointmentdoctor_future_cubit/appointment_future_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentFutureCubit extends Cubit<ApointmentFutureState> {
  final DoctorFutureAppointmentRepo doctorFutureAppointmentRepo;

  AppointmentFutureCubit(this.doctorFutureAppointmentRepo)
    : super(AppointmentFutureInitial()) {
    getFuturedoctorAppointments();
  }

  Future<void> getFuturedoctorAppointments() async {
    emit(AppointmentFutureLoading());

    final result =
        await doctorFutureAppointmentRepo.getFuturedoctorAppointments();

    result.fold(
      (failure) => emit(AppointmentFutureFailure(failure.message)),
      (model) => emit(AppointmentFutureSuccess(model)),
    );
  }
}
