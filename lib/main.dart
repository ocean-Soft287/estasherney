import 'dart:convert';

import 'package:consult_me/bloc_observer.dart';
import 'package:consult_me/core/connectivity/cubit/connectivity_cubit.dart';
import 'package:consult_me/core/navigation/navigation_service.dart';
import 'package:consult_me/core/services/local_services.dart';
import 'package:consult_me/features/call/data/models/my_call_model.dart';
import 'package:consult_me/firebase_options.dart';
import 'package:consult_me/patient/auth/presentation/views/screens/login/presentation/logic/deleate_account_cubit.dart';
import 'package:consult_me/patient/booking/presentation/cubit/booking_cubit.dart';
import 'package:consult_me/patient/intial/splash_screen.dart';
import 'package:consult_me/patient/localization/manger/localization_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'core/connectivity/widgets/connectivity_wrapper.dart';
import 'features/call/presentation/pages/video.dart';
import 'generated/l10n.dart';
import 'patient/localization/data/localizationmodel.dart';
import 'patient/localization/manger/localization_state.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await setup();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _setupFirebaseMessaging();
  }

  void _setupFirebaseMessaging() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.data.isNotEmpty) {
        _handleMessage(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data.isNotEmpty) {
        _handleMessage(message);
      }
    });

    messaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null && message.data.isNotEmpty) {
        _handleMessage(message);
      }
    });
  }

  void _handleMessage(RemoteMessage message) {
    try {
      final callData = message.data['call'];
      if (callData != null) {
        final MyCallModel callModel = MyCallModel.fromJson(jsonDecode(callData));
        NavigationService.push(Video(call: callModel));
      }
    } catch (e) {
      print('Error handling notification message: $e');
    }
  }

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
          create: (context) => sl<ConnectivityCubit>(),
        ),
        BlocProvider(
          create: (context) =>
              LocalizationCubit()..appLanguage(LanguageEventEnums.initialLanguage),
        ),
        BlocProvider(create: (context) => GetIt.instance<DeleteAccountCubit>()),
        BlocProvider(create: (context) => GetIt.instance<BookingCubit>()),
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
                locale: locale,
                debugShowCheckedModeBanner: false,
                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                builder: (context, child) {
                  return ConnectivityWrapper(
                    child: child!,
                  );
                },
                localeResolutionCallback: (deviceLocale, supportedLocals) {
                  for (var local in supportedLocals) {
                    if (deviceLocale != null) {
                      if (deviceLocale.languageCode == local.languageCode) {
                        return deviceLocale;
                      }
                    }
                  }
                  return supportedLocals.first;
                },
                home: const SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
