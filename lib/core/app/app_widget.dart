import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../navigation/navigation_service.dart';
import '../connectivity/cubit/connectivity_cubit.dart';
import '../connectivity/cubit/connectivity_state.dart';
import '../connectivity/screens/offline_screen.dart';
import '../../patient/intial/splash_screen.dart';
import '../../patient/localization/manger/localization_cubit.dart';
import '../../patient/localization/manger/localization_state.dart';
import '../../patient/localization/data/localizationmodel.dart';
import '../../generated/l10n.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, LocalizationState>(
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
              home: BlocBuilder<ConnectivityCubit, ConnectivityState>(
                builder: (context, connectivityState) {
                  return Stack(
                    children: [
                      // Main app content
                      SplashScreen(),
                      // Offline overlay
                      if (connectivityState is ConnectivityOffline)
                        const OfflineScreen(),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
