import 'package:consult_me/doctor/auth/data/repo/resetpassword/resetpassword_repo.dart';
import 'package:consult_me/doctor/auth/presentation/logic/cubit/resetpassword/resetpassword_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo resetPasswordRepo;

  ResetPasswordCubit(this.resetPasswordRepo) : super(ResetPasswordInitial());

  Future<void> resetPassword({
    required String email,
    required String token,
    required String newPassword,
  }) async {
    emit(ResetPasswordLoading());

    final result = await resetPasswordRepo.resetPassword(
      email: email,
      token: token,
      newPassword: newPassword,
    );

    result.fold((failure) {
      print(failure.message);
      emit(ResetPasswordFailure(failure.message));
    }, (model) => emit(ResetPasswordSuccess(model.message)));
  }
}
