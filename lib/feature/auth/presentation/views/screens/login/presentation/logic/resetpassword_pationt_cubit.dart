import 'package:consult_me/feature/auth/presentation/views/screens/login/data/repo/resetpassword_pationt_repo.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/presentation/logic/resetpassword_pationt_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ResetpasswordPationtCubit extends Cubit<ResetpasswordPationtState> {
  final ResetpasswordPationtRepo resetpasswordPationtRepo;

  ResetpasswordPationtCubit(this.resetpasswordPationtRepo)
      : super(ResetpasswordPationtInitial());

  Future<void> resetPassword({
    required String email,
    required String token,
    required String newPassword,
  }) async {
    emit(ResetpasswordPationtLoading());

    print('====== Reset Password Values ======');
    print('Email: $email');
    print('Token: $token');
    print('New Password: $newPassword');
    print('===================================');

    final result = await resetpasswordPationtRepo.forgetPassword(
      email: email,
      token: token,
      newPassword: newPassword,
    );

    result.fold(
      (failure) {
        print('❌ Reset Password Failed: ${failure.message}');
        emit(ResetpasswordPationtFailure(error: failure.message));
      },
      (response) {
        print('✅ Reset Password Success: $response');
        emit(ResetpasswordPationtSuccess(message: response));
      },
    );
  }
}
