import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/data/model/get_allspecialist.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/data/model/get_doctor_model_pationt.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/data/repo/getallspecialist_repo.dart/get_all_specialist_repo.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/data/repo/get_doctor_pationt/get_doctor_pationt_repo.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/manager/cubit/get_all_specialist_doctor_state.dart';

class GetAllSpecialistCubit extends Cubit<GetAllSpecialistState> {
  final GetAllSpecialistRepo getAllSpecialistRepo;
  final GetDoctorsBySpecialtyRepo doctorRepo;

  List<GetAllspecialistModel> allSpecialists = [];
  List<DoctorModel> doctorsBySpecialty = [];
  String? selectedSpecialtyId;

  GetAllSpecialistCubit(this.getAllSpecialistRepo, this.doctorRepo)
      : super(GetAllSpecialistInitial());


  Future<void> getAllSpecialistDoctor() async {
    emit(GetAllSpecialistLoading());
    final result = await getAllSpecialistRepo.getAllSpecialists();
    result.fold(
      (failure) {
        emit(GetAllSpecialistFailure(errorMessage: failure.message));
      },
      (specialists) {
        allSpecialists = specialists;
        emit(GetAllSpecialistSuccess(specialist: specialists));
      },
    );
  }

  
  void searchSpecialist(String query) {
    if (query.trim().isEmpty) {
      emit(GetAllSpecialistSuccess(specialist: allSpecialists));
      return;
    }

    final filtered = allSpecialists
        .where((s) => s.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (filtered.isEmpty) {
      emit(GetAllSpecialistFailure(
        errorMessage: 'لم يتم العثور على تخصصات تطابق "$query"',
      ));
    } else {
      emit(GetAllSpecialistSuccess(specialist: filtered));
    }
  }

  
  Future<void> selectSpecialty(String specialtyName) async {

    final selected = allSpecialists.firstWhere(
      (s) => s.name == specialtyName,
      orElse: () {
        return GetAllspecialistModel(id: 0, name: '');
      },
    );

    if (selected.id == 0) {
      emit(GetAllSpecialistFailure(errorMessage: 'التخصص "$specialtyName" غير موجود.'));
      return;
    }

    selectedSpecialtyId = selected.id.toString();
    emit(GetAllSpecialistLoading());

    final result = await doctorRepo.getDoctorsBySpecialty(selectedSpecialtyId!);
    result.fold(
      (failure) {
        emit(GetAllSpecialistDoctorsFailure(
          errorMessage: failure.message,
          specialist: allSpecialists,
          selectedSpecialty: specialtyName,
        ));
      },
      (doctors) {
        doctorsBySpecialty = doctors;
        if (doctors.isEmpty) {
          emit(GetAllSpecialistDoctorsFailure(
            errorMessage: 'لا يوجد أطباء لتخصص "$specialtyName".',
            specialist: allSpecialists,
            selectedSpecialty: specialtyName,
          ));
        } else {
          emit(GetAllSpecialistDoctorsLoaded(
            specialist: allSpecialists,
            selectedSpecialty: specialtyName,
            doctors: doctors,
          ));
        }
      },
    );
  }
}
