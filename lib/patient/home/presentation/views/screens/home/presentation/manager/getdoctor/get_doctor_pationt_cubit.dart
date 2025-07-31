import 'package:consult_me/core/Network/local/secure_storage.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/presentation/manager/getdoctor/get_doctor_pationt_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/data/repo/get_doctor_pationt/get_doctor_pationt_repo.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/data/model/get_doctor_model_pationt.dart';

class GetDoctorsBySpecialtyCubit extends Cubit<GetDoctorsBySpecialtyState> {
  final GetDoctorsBySpecialtyRepo repo;

  List<DoctorModel> _allDoctors = [];
  String _currentSpecialty = '';

  GetDoctorsBySpecialtyCubit(this.repo) : super(GetDoctorsBySpecialtyInitial());

  Future<void> fetchDoctors(String specialty) async {
    emit(GetDoctorsBySpecialtyLoading());
    _currentSpecialty = specialty;

    final result = await repo.getDoctorsBySpecialty(specialty);
    result.fold(
      (failure) => emit(GetDoctorsBySpecialtyFailure(errorMessage: failure.message)),
      (doctors) async {
        _allDoctors = doctors;

       
        final favorites = await SharedPreferencesService.getFavorites();
        final favoriteIds = favorites.map((fav) => fav['id']).toSet();

        
        final updatedDoctors = doctors.map((doctor) {
          doctor.isFavorite = favoriteIds.contains(doctor.id);
          return doctor;
        }).toList();

        emit(GetDoctorsBySpecialtySuccess(doctors: updatedDoctors));
      },
    );
  }

  void searchDoctors(String query) {
    final filtered = _allDoctors.where((doc) {
      final nameMatch = doc.name.toLowerCase().contains(query.toLowerCase());
      final specializationMatch = doc.specialization.toLowerCase().contains(query.toLowerCase());
      return nameMatch || specializationMatch;
    }).toList();

    emit(GetDoctorsBySpecialtySuccess(doctors: filtered));
  }

  void filterBySpecialty(String specialty) {
    _currentSpecialty = specialty;

    final filtered = _allDoctors.where((doc) =>
      specialty == 'الكل' || doc.specialization == specialty
    ).toList();

    emit(GetDoctorsBySpecialtySuccess(doctors: filtered));
  }

  void clearFilters() {
    _currentSpecialty = '';
    emit(GetDoctorsBySpecialtySuccess(doctors: _allDoctors));
  }

  String get currentSpecialty => _currentSpecialty;
}
