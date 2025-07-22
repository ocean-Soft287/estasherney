import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/Network/local/secure_storage.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/auth/data/model/login_model.dart';
import 'package:consult_me/doctor/auth/data/repo/login/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepoImpl implements LoginRepo {
  final DioConsumer dioConsumer;

  LoginRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    try {
      final response = await dioConsumer.post(
        EndPoint.logindoctor,
        data: {
          'email': email,
          'password': password,
          'rememberMe': rememberMe,
        },
      );

      if (response is! Map<String, dynamic>) {
        return left(ServerFailure("Invalid response format"));
      }

      final model = LoginModel.fromJson(response);

      if (model.token.isEmpty) {
        return left(ServerFailure("Missing token in response."));
      }

     
      if (rememberMe) {
        await SharedPreferencesService.write(
            SharedPreferencesService.email, model.email);
        await SharedPreferencesService.write(
            SharedPreferencesService.password, password);
      }

      return right(model);
    } on DioException catch (e) {
      return left(_handleDioError(e));
    } catch (e) {
      return left(ServerFailure("حدث خطأ أثناء تسجيل الدخول، حاول مرة أخرى."));
    }
  }

  Failure _handleDioError(DioException error) {
    return ServerFailure(error.message ?? "Unknown error occurred");
  }
}
