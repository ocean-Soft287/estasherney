import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/Network/local/sharedprefrences.dart';
import 'package:consult_me/doctor/auth/data/repo/forgetpassword/forgetpassword_repo.dart';
import 'package:consult_me/doctor/auth/data/repo/forgetpassword/forgetpasword_repo_impl.dart';
import 'package:consult_me/doctor/auth/data/repo/login/login_repo.dart';
import 'package:consult_me/doctor/auth/data/repo/login/login_repo_impl.dart';
import 'package:consult_me/doctor/auth/data/repo/resetpassword/resetpassword_repo.dart';
import 'package:consult_me/doctor/auth/data/repo/resetpassword/resetpassword_repo_impl.dart';
import 'package:consult_me/doctor/auth/presentation/logic/cubit/login_cubit.dart';
import 'package:consult_me/doctor/auth/presentation/logic/cubit/resetpassword/resetpasword_cubit.dart';
import 'package:consult_me/doctor/auth/presentation/logic/fotgetpassword/forgetpassword_cubit.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/repo/Appointmentday/appointment_day_repo.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/repo/Appointmentday/appointment_day_repo_impl.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/repo/appointpast/appointment_past_repo.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/repo/appointpast/appointment_past_repo_impl.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/repo/doctorfuturAppointment/doctor_future_appointment_repo.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/repo/doctorfuturAppointment/doctor_future_appointment_repo_impl.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/repo/searchAppointment/searchappoinment_repo_impl.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/data/repo/searchAppointment/searchappointment_repo.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/logic/appointment_day_cubit/appointment_day_cubit.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/logic/appointmentdoctor_future_cubit/appointment_future_cubit.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/logic/appointmentpast/appointment_past_cubit.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/logic/searchappoint/searchAppontment_cubit.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/data/repo/availabledoctor/doctor_available_request_repo.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/data/repo/availabledoctor/doctor_vailable_request_repo_impl.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/data/repo/price/price_repo.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/data/repo/price/price_repo_impl.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/presentation/logic/availabledoctor/doctor_availble_cubit.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/presentation/logic/pricedoctor/price_doctor_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> setup() async{
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
  //forget password
  sl.registerLazySingleton<ForgetPasswordRepo>(
    () => ForgetPasswordRepoImpl(dioConsumer: sl<DioConsumer>(),),
  );
  sl.registerFactory(() => ForgetPasswordCubit(sl<ForgetPasswordRepo>()));
  //appointment
  sl.registerLazySingleton<AppointmentRepo>(
    () => AppointmentRepoImpl(dio: sl<DioConsumer>()),
  );
  sl.registerFactory(() => AppointmentCubit(sl<AppointmentRepo>()));
  //reset password
 
sl.registerLazySingleton<ResetPasswordRepo>(
  () => ResetPasswordRepoImpl(dioConsumer: sl<DioConsumer>()),
);


sl.registerFactory(() => ResetPasswordCubit(sl<ResetPasswordRepo>()));

  sl.registerLazySingleton<DoctorFutureAppointmentRepo>(
    () => DoctorFutureAppointmentRepoImpl(dioConsumer: sl<DioConsumer>()),
  );

  sl.registerFactory(() => AppointmentFutureCubit(sl<DoctorFutureAppointmentRepo>()));
  //past appointment
  sl.registerLazySingleton<PastAppointmentRepo>(
    () => AppointmentPastRepoImpl(dioConsumer: sl<DioConsumer>()),
  );
  sl.registerFactory(() => PastAppointmentCubit(sl<PastAppointmentRepo>()));
//serch appointment
  sl.registerLazySingleton<SearchAppointmentRepo>(
    () => SearchAppointmentRepoImpl(dio: sl<DioConsumer>()),
  );
  sl.registerFactory(() => SearchAppointmentCubit(sl<SearchAppointmentRepo>()));
  //DOCTOR AVAILABILITY
  sl.registerLazySingleton<AddAvailabilityRepo>(  
    () => DoctorAvailbleRequestRepoImpl(dioConsumer: sl<DioConsumer>()),
  );
  sl.registerFactory(() => AddAvailabilityCubit(sl<AddAvailabilityRepo>()));  
 //price
  sl.registerLazySingleton<PriceRepo>(
    () => PriceRepoImpl(dioConsumer: sl<DioConsumer>()),
  );
  sl.registerFactory(() => PriceCubit(sl<PriceRepo>()));
  await CacheHelper.init();
  await Supabase.initialize(
    url: 'https://urvvmzyekyaoabykrswi.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVydnZtenlla3lhb2FieWtyc3dpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwOTIxOTEsImV4cCI6MjA2ODY2ODE5MX0.stIhnDGvjNJ9VtGHXU3C-v7umA3KLOzSWhtiML1Gm1w',
  );

 
}
