import 'package:bloc/bloc.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/data/repo/Appointmentday/appointment_day_repo.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/widget/appointment_day_cubit/appointment_day_state.dart';
class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepo appointmentRepo;

  AppointmentCubit(this.appointmentRepo) : super(AppointmentInitial()) {
    getTodayAppointments(); 
  }

  Future<void> getTodayAppointments() async {
    emit(AppointmentLoading());
    final result = await appointmentRepo.getTodayAppointments();
    result.fold(
      (failure) => emit(AppointmentFailure(failure.message)),
      (appointments) => emit(AppointmentSuccess(appointments)),
    );
  }
}

