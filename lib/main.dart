import 'package:consult_me/core/network/local/sharedprefrences.dart';
import 'package:consult_me/feature/intial/splash_screen.dart';
import 'package:consult_me/feature/localization/manger/localization_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'feature/localization/data/localizationmodel.dart';
import 'feature/localization/manger/localization_state.dart';
import 'feature/payment/presentation/view/screens/payment_methods.dart';
import 'feature/payment/presentation/view/screens/paynow.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  await CacheHelper.init(); // Wait for CacheHelper to initialize
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
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
          create: (context) => LocalizationCubit()..appLanguage(LanguageEventEnums.initialLanguage),
        ),
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, langState) {
          Locale locale = const Locale('ar'); // Default language is Arabic

          if (langState is ChangeLanguage) {
            locale = Locale(langState.languageCode);
          }

          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                locale: locale, // Set the default locale

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
                  return const Locale('ar'); // Fallback to Arabic
                },
                home:  PaymentMethods(),
              );
            },
          );
        },
      ),
    );
  }
}