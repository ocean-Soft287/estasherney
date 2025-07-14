import 'package:bloc/bloc.dart';
import 'package:consult_me/core/Network/local/secure_storage.dart';
import 'package:consult_me/doctor/auth/data/model/login_model.dart';
import 'package:consult_me/doctor/auth/data/repo/login/login_repo.dart';
import 'package:consult_me/doctor/auth/presentation/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  final LoginRepo loginRepo;
  LoginModel? user;

  Future<void> login({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    emit(AuthLoading());

    final response = await loginRepo.login(
      email: email,
      password: password,
      rememberMe: rememberMe,
    );

    response.fold(
      (failure) {
        emit(AuthFailure(failure.message));
      },
      (data) async {
        user = data;

       
        await SharedPreferencesService.write(
            SharedPreferencesService.token, data.token);
        await SharedPreferencesService.write(
            SharedPreferencesService.firstName, data.name);
        await SharedPreferencesService.write(
            SharedPreferencesService.picture, data.doctorImage);

        
        await SharedPreferencesService.saveUserData(data.toJson());

      
        if (rememberMe) {
          await SharedPreferencesService.write(
              SharedPreferencesService.email, email);
          await SharedPreferencesService.write(
              SharedPreferencesService.password, password);
        }

        emit(AuthSuccess(data: data));
      },
    );
  }
}
