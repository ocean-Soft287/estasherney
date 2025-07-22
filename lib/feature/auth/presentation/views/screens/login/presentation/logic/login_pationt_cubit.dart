import 'package:consult_me/core/Network/local/secure_storage.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/data/repo/login_pation_repo.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/presentation/logic/login_pationt_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPationtCubit extends Cubit<LoginpationtState> {
  final LoginPatientRepo loginPatientRepo;

  LoginPationtCubit(this.loginPatientRepo) : super(LoginInitial());

  Future<void> loginPatient({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    emit(AuthLoading());

    final result = await loginPatientRepo.loginPatient(
      email: email,
      password: password,
      rememberMe: rememberMe,
    );

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (data) async {
        await SharedPreferencesService.write(
            SharedPreferencesService.tokenpationt, data.token);
            await SharedPreferencesService.write(
            SharedPreferencesService.idpationt, data.id.toString());
        await SharedPreferencesService.write(
            SharedPreferencesService.email,data.email);
            await SharedPreferencesService.write(
            SharedPreferencesService.birthday, data.birthday);
        await SharedPreferencesService.write( 
            SharedPreferencesService.fulNamepationt, data.fullname);
        await SharedPreferencesService.write(
            SharedPreferencesService.phoneNumber, data.phonenumber);
        await SharedPreferencesService.write(
            SharedPreferencesService.imageurlpationt, data.imageurl);
       
       
        emit(AuthSuccess(data: data));
      },
    );
  }
}
