import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:consult_me/patient/auth/presentation/views/screens/register/data/repo/register_repo.dart';
import 'register_state.dart';
import 'dart:typed_data';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;

  RegisterCubit(this.registerRepo) : super(RegisterInitial());

  Future<void> registerPatient({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
    required String birthday,
    required Uint8List imageBytes, // ✅ عدلنا هنا
  }) async {
    emit(RegisterLoading());

    final result = await registerRepo.registerPatient(
      fullName: fullName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      birthday: birthday,
      imageBytes: imageBytes, 
    );

    result.fold(
      (failure) => emit(RegisterFailure(failure.message)),
      (success) => emit(RegisterSuccess()),
    );
  }
}
