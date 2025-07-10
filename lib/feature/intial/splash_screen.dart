import 'package:consult_me/core/Network/local/secure_storage.dart';
import 'package:consult_me/doctor/auth/data/model/login_model.dart';
import 'package:consult_me/doctor/home/home_view.dart';
import 'package:consult_me/feature/intial/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

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
    final token = await SharedPreferencesService.read(
      SharedPreferencesService.token,
    );

    await Future.delayed(const Duration(seconds: 3));

    if (token != null && token.isNotEmpty) {
      final userJson = await SharedPreferencesService.getUserData();

      if (userJson != null) {
        final user = LoginModel.fromJson(userJson);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreenDoctor(user: user),
          ),
        );
        return;
      }
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OnboardingView(),
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
