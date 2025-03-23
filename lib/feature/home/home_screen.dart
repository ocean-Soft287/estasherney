import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites.dart';
import 'package:consult_me/feature/home/presentation/views/screens/data_view.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home_view.dart';
import 'package:consult_me/feature/home/presentation/views/screens/message_view.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile_view.dart';
import 'package:consult_me/feature/home/presentation/views/screens/question_view.dart';
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
    Favourites(),
    QuestionView(),
    ProfileView(),
    DataView(),
    MessageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, 
        onTap: (index) {
          setState(() {
            currentIndex = index; 
          });
        },
        type: BottomNavigationBarType.fixed, 
        backgroundColor: AppColors.mainColor.withOpacity(0.9), 
        selectedItemColor: Colors.white, 
        unselectedItemColor: Colors.black, 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_outlined),
            label: "favourite", 
          ),
         
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: "Message", 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile", 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            label: "Date",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: "Question", 
          ),
        ],
      ),
    );
  }
}

