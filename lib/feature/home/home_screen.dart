import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites.dart';
import 'package:consult_me/feature/home/presentation/views/screens/data_view.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home_view.dart';
import 'package:consult_me/feature/home/presentation/views/screens/message_view.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/profile_view.dart';
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
    return IconButton(
      icon: Icon(
        icon,
        color: currentIndex == index ? AppColors.mainColor : Colors.black,
        size: 28,
      ),
      onPressed: () {
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}
