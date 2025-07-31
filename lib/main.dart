import 'package:consult_me/bloc_observer.dart';
import 'package:consult_me/core/navigation/navigation_service.dart';
import 'package:consult_me/core/services/local_services.dart';
import 'package:consult_me/patient/auth/presentation/views/screens/login/presentation/logic/deleate_account_cubit.dart';
import 'package:consult_me/patient/booking/data/models/booking_response.dart';
import 'package:consult_me/patient/intial/splash_screen.dart';
import 'package:consult_me/patient/localization/manger/localization_cubit.dart';
import 'package:consult_me/patient/payment/presentation/view/screens/payment_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'patient/localization/data/localizationmodel.dart';
import 'patient/localization/manger/localization_state.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  Bloc.observer = MyBlocObserver();
  runApp(DevicePreview(enabled: true
  , builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < 500) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  LocalizationCubit()
                    ..appLanguage(LanguageEventEnums.initialLanguage),
        ),
        BlocProvider(
          create: (context) => GetIt.instance<DeleteAccountCubit>(),
        ),
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, langState) {
          Locale locale = const Locale('ar');

          if (langState is ChangeLanguage) {
            locale = Locale(langState.languageCode);
          }

          return ScreenUtilInit(
            
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                navigatorKey: NavigationService.navigatorKey,
                          locale: const Locale('ar'), 

                debugShowCheckedModeBanner: false,
                

                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocals) {
                  for (var local in supportedLocals) {
                    if (deviceLocale != null) {
                      if (deviceLocale.languageCode == local.languageCode) {
                        return deviceLocale;
                      }
                    }
                  }
                   return const Locale('ar');
                },
                home:PaymentPage(response: BookingResponse(message: '', appointmentId: 8, finalConsultationPrice: 305),)
                //  SplashScreen(
                  
                // ),
             
              );
            },
          );
        },
      ),
    );
  }
}
