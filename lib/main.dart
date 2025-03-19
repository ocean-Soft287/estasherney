import 'package:consult_me/feature/intial/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feature/doctors/presentation/view/screens/Specializations.dart';
import 'feature/doctors/presentation/view/screens/about_aboutdoctor.dart';

void main() {
  runApp(DevicePreview(
      enabled: true,


  builder: (context) => const MyApp(),
  ));


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AboutAboutdoctor(),
      ),
    );
  }
}
