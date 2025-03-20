import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/home/presentation/views/screens/data_view.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home_view.dart';
import 'package:consult_me/feature/home/presentation/views/screens/message_view.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile_view.dart';
import 'package:consult_me/feature/home/presentation/views/screens/question_view.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    HomeView(),
    MessageView(),
    ProfileView(),
    DataView(),
    QuestionView()

    


  ];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar:FluidNavBar(
        onChange: (value) {
              setState(() {
                currentindex = value;
              });
            },
            style:
              FluidNavBarStyle(
                barBackgroundColor: AppColors.mainColor.withOpacity(0.9),

                iconSelectedForegroundColor: Colors.white,
                iconUnselectedForegroundColor: Colors.black),
                icons: [
                  FluidNavBarIcon(
                    icon: Icons.home
                  ),
                   FluidNavBarIcon(
                    icon: Icons.question_answer
                  ),
                   FluidNavBarIcon(
                    icon: Icons.person
                  ),
                   FluidNavBarIcon(
                    icon: Icons.date_range
                  ),
                  FluidNavBarIcon(
                    icon: Icons.question_mark
                  ),
                 
                ], 
      ) ,
    );
  }
}
