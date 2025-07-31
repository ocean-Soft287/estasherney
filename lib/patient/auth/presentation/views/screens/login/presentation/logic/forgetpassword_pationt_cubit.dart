import 'package:consult_me/patient/auth/presentation/views/screens/login/data/repo/forgettpassword_pationt_repo.dart';
import 'package:consult_me/patient/auth/presentation/views/screens/login/presentation/logic/forgetpassword_pationt_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetpasswordPationtCubit extends Cubit<ForgetpasswordPationtScreenState> {
  final ForgetPasswordPatientRepo forgetPasswordPatientRepo;

  ForgetpasswordPationtCubit({required this.forgetPasswordPatientRepo})
      : super(ForgetPasswordPationtInitial());

  Future<void> sendResetLink(String email) async {
    emit(ForgetPasswordPationtLoading());
    final result = await forgetPasswordPatientRepo.forgetPassword(
      email: email,
      token: '', 
      newPassword: '', 
    );
    result.fold(
      (failure) => emit(ForgetPasswordPationtFailure(error: failure.message)),
      (success) =>
          emit(ForgetPasswordPationtSuccess(message: success.message)),
    );
  }
} 