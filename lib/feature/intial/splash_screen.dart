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

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingView()),
      );
    });
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
