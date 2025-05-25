
import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/Additionaloptions/presentation/screens/additional_option.dart';
import 'presentation/screens/help/presentation/screens/help_screen.dart';
import 'presentation/screens/homeview/presentation/screens/hom_view_doctor.dart';
import 'presentation/screens/myclinic/presentation/screens/my_clinic.dart';
import 'presentation/screens/offers/presentation/screens/offers_screens.dart';

class HomeScreenDoctor extends StatefulWidget {
  const HomeScreenDoctor({super.key});

  @override
  State<HomeScreenDoctor> createState() => _HomeScreenDoctorState();
}

class _HomeScreenDoctorState extends State<HomeScreenDoctor> {
  int currentIndex = 0;
 final List<Widget> screens = [
    HomViewDoctor(),
    const OffersScreens(),
    const MyClinicDoctor(),
    const HelpScreen(),
    const AdditionalOption(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem('assets/images/Group 67 (1).png', 0),
            buildNavItem('assets/images/Group (2).png', 1),
            buildNavItem('assets/images/Vector (20).png', 2),
            buildNavItem('assets/images/Vector (21).png', 3),
            buildNavItem('assets/images/Group (3).png', 4),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(String imagePath, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 50,
        height: 40,
        decoration: BoxDecoration(
          color: currentIndex == index ? AppColors.mainColor.withOpacity(0.7) : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            color: currentIndex == index ? Colors.white : Color(0xff4B4E9C),
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}

