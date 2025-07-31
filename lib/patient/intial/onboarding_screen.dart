import 'package:consult_me/core/widget/defualt_botton.dart';
import 'package:consult_me/patient/intial/page_one.dart';
import 'package:consult_me/patient/intial/page_three.dart';
import 'package:consult_me/patient/intial/page_two.dart';
import 'package:consult_me/patient/intial/welcome_screen.dart';
import 'package:consult_me/patient/intial/widget/custom_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  
  const OnboardingScreen({super.key,});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void nextPage() {
    if (index < 2) {
      controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              children: const [PageOne(), PageTwo(), PageThree()],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (i) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: CustomIndicator(active: i == index),
              ),
            ),
          ),

          SizedBox(height: 30.h),

          Padding(
            padding: const EdgeInsets.all(16),
            child: DefaultButton(
              text: index < 2 ? "التالي" : "ابدأ",
              function: nextPage,
            ),
          ),

          
        ],
      ),
    );
  }
}
