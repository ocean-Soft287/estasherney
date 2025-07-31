import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/favourites/presentation/screens/favourites.dart';
import 'package:consult_me/patient/home/presentation/views/screens/data_view.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/presentation/screens/home_view.dart';
import 'package:consult_me/patient/home/presentation/views/screens/message/message_view.dart';
import 'package:consult_me/patient/home/presentation/views/screens/profile/profile_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeView(),
    const ProfileScreen(),
    const Favourites(),
    const MessageView(),
    const DataView(),
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
            buildNavItem(Icons.home, 0),
            buildNavItem(Icons.person, 1),
            buildNavItem(Icons.favorite_outline_outlined, 2),
            buildNavItem(Icons.question_answer, 3),
            buildNavItem(Icons.date_range, 4),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, int index) {
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
          child: Icon(
            icon,
            color: currentIndex == index ? Colors.white : Colors.black,
            size: 28,
          ),
        ),
      ),
    );
  }
}

