import 'package:consult_me/core/notifications/firebase_messaging_service.dart';
import 'package:consult_me/patient/home/home_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:consult_me/core/Network/local/secure_storage.dart';
import 'package:consult_me/doctor/auth/data/model/login_model.dart';

import 'package:consult_me/doctor/home/home_view.dart';
import 'package:consult_me/patient/intial/onboarding_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    await Future.delayed(const Duration(seconds: 3));

    final doctorToken = await SharedPreferencesService.read(
        SharedPreferencesService.token);

    final patientToken = await SharedPreferencesService.read(
        SharedPreferencesService.tokenpationt);
   final firebaseMessagingService = FirebaseMessagingService.instance();

    if (doctorToken != null && doctorToken.isNotEmpty) {
      final doctorUserJson = await SharedPreferencesService.getUserData();
      if (doctorUserJson != null) {
        final doctorUser = LoginModel.fromJson(doctorUserJson);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreenDoctor(user: doctorUser),
          ),
        );
        return;
      }
    }

    if (patientToken != null && patientToken.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
      return;
    }

    // لو مفيش تسجيل دخول
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OnboardingView(), //Chat2 OnboardingView
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SlideInLeft(
              duration: const Duration(milliseconds: 1000),
              child: Image.asset("assets/images/logo.png"),
            ),
            SlideInLeft(
              duration: const Duration(milliseconds: 1200),
              child: Image.asset("assets/images/image_two.png"),
            ),
          ],
        ),
      ),
    );
  }
}
