import 'package:consult_me/feature/home/presentation/views/screens/home/data/model/get_allspecialist.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/data/model/get_doctor_model_pationt.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/data/repo/get_doctor_pationt/get_doctor_pationt_repo.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/data/repo/getallspecialist_repo.dart/get_all_specialist_repo.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/manager/cubit/get_all_specialist_doctor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllSpecialistCubit extends Cubit<GetAllSpecialistState> {
  final GetAllSpecialistRepo getAllSpecialistRepo;
  final GetDoctorsBySpecialtyRepo doctorRepo; 

  List<GetAllspecialistModel> allSpecialists = [];
  List<DoctorModel> doctorsBySpecialty = [];
  String? selectedSpecialty;

  GetAllSpecialistCubit(this.getAllSpecialistRepo, this.doctorRepo) : super(GetAllSpecialistInitial());

  Future<void> getAllSpecialistDoctor() async {
    emit(GetAllSpecialistLoading());

    final result = await getAllSpecialistRepo.getAllSpecialists();
    result.fold(
      (failure) => emit(GetAllSpecialistFailure(errorMessage: failure.message)),
      (specialists) {
        allSpecialists = specialists;
        emit(GetAllSpecialistSuccess(specialist: specialists));
      },
    );
  }

  void searchSpecialist(String query) {
    if (query.isEmpty) {
      emit(GetAllSpecialistSuccess(specialist: allSpecialists));
    } else {
      final filtered = allSpecialists.where((specialist) =>
          specialist.name.toLowerCase().contains(query.toLowerCase())
      ).toList();

      emit(GetAllSpecialistSuccess(specialist: filtered));
    }
  }

  Future<void> selectSpecialty(String specialtyName) async {
    selectedSpecialty = specialtyName;
    emit(GetAllSpecialistLoading());

    final result = await doctorRepo.getDoctorsBySpecialty(specialtyName);
    result.fold(
      (failure) => emit(GetAllSpecialistFailure(errorMessage: failure.message)),
      (doctors) {
        doctorsBySpecialty = doctors;
        emit(GetAllSpecialistDoctorsLoaded(
          specialist: allSpecialists,
          selectedSpecialty: selectedSpecialty!,
          doctors: doctorsBySpecialty,
        ));
      },
    );
  }
}
