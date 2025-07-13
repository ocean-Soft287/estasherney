import 'package:bloc/bloc.dart';
import 'package:consult_me/doctor/auth/data/repo/forgetpassword/forgetpassword_repo.dart';
import 'package:consult_me/doctor/auth/presentation/logic/fotgetpassword/forgettpasword_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo forgetPasswordRepo;

  ForgetPasswordCubit(this.forgetPasswordRepo) : super(ForgetPasswordInitial());

  Future<void> sendResetLink(String email) async {
    emit(ForgetPasswordLoading());

    final result = await forgetPasswordRepo.forgetPassword(email);

    result.fold(
      (failure) => emit(ForgetPasswordFailure(failure.message)),
      (model) => emit(ForgetPasswordSuccess(model)),
    );
  }
}
