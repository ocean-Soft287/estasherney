import 'package:bloc/bloc.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/data/repo/searchAppointment/searchappointment_repo.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/logic/searchappoint/searchappointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAppointmentCubit extends Cubit<SearchAppointmentState> {
  final SearchAppointmentRepo searchRepo;

  SearchAppointmentCubit(this.searchRepo) : super(SearchAppointmentInitial());

  Future<void> search(String patientName) async {
    emit(SearchAppointmentLoading());

    final result = await searchRepo.searchAppointmentsByPatientName(patientName);

    result.fold(
      (failure) => emit(SearchAppointmentFailure(failure.message)),
      (results) => emit(SearchAppointmentSuccess(results)),
    );
  }

  void clearSearch() {
    emit(SearchAppointmentInitial());
  }
}
