import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/doctor/auth/data/repo/login_repo.dart';
import 'package:consult_me/doctor/auth/data/repo/login_repo_impl.dart';
import 'package:consult_me/doctor/auth/presentation/logic/cubit/login_cubit.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/data/repo/appointment_day_repo.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/data/repo/appointment_day_repo_impl.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/widget/appointment_day_cubit/appointment_day_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setup() {
  // --- Dio & DioConsumer ---
  sl.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: EndPoint.baseUrl))
      ..interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      ),
  );
   sl.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: sl<Dio>()));

  // --- Login ---
  sl.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(dioConsumer: sl<DioConsumer>()),
  );
  sl.registerFactory(() => LoginCubit(sl<LoginRepo>()));
  //appointment
  sl.registerLazySingleton<AppointmentRepo>(
    () => AppointmentRepoImpl(dio: sl<DioConsumer>()),
  );
  sl.registerFactory(() => AppointmentCubit(sl<AppointmentRepo>()));
}
