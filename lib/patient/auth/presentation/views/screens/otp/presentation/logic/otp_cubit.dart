import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:consult_me/patient/auth/presentation/views/screens/otp/presentation/logic/otp_state.dart';
import 'package:consult_me/patient/auth/presentation/views/screens/otp/data/repo/otp_repo.dart';
class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final VerifyOtpRepo verifyOtpRepo;

  VerifyOtpCubit(this.verifyOtpRepo) : super(VerifyOtpInitial());

  void verifyOtp({required String email, required String token}) async {
    emit(VerifyOtpLoading());
    final result = await verifyOtpRepo.verifyOtp(email: email, otp: token);

    result.fold(
      (failure) => emit(VerifyOtpFailure(failure.message)),
      (message) => emit(VerifyOtpSuccess(message.message)),
    );
  }
}
