import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/doctor/home/presentation/screens/chat/presentation/screens/chat_screen.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Calendar.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/appointment_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomViewDoctor extends StatelessWidget {
  const HomViewDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/images/logo.png",
                  width: screenWidth * 0.1,
                  height: screenWidth * 0.1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: screenWidth * 0.025,
                left: screenWidth * 0.025,
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/image (8).png",
                    width: screenWidth * 0.25,
                    height: screenWidth * 0.25,
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Column(
                    children: [
                      Text(
                        "دكتورة علا عادل",
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.mainColor,
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        " طب الأطفال",
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.mainColor,
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.favorite_outline, color: AppColors.mainColor),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: Text(
                " لايوجد موعد قادم الأن ",
                style: GoogleFonts.leagueSpartan(
                  color: AppColors.mainColor,
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppointmentScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.025),
                      width: screenWidth * 0.4,
                      height: screenWidth * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.mainColor,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/Vector (22).png",
                            width: screenWidth * 0.15,
                          ),
                          SizedBox(height: screenWidth * 0.02),
                          Text(
                            "مواعيدي",
                            style: GoogleFonts.leagueSpartan(
                              color: AppColors.wightcolor,
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalendarScreens(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.025),
                      width: screenWidth * 0.4,
                      height: screenWidth * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.mainColor,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/Group (5).png",
                            width: screenWidth * 0.15,
                          ),
                          SizedBox(height: screenWidth * 0.06),
                          Text(
                            "التقويم",
                            style: GoogleFonts.leagueSpartan(
                              color: AppColors.wightcolor,
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatSceeens(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.025),
                  width: screenWidth * 0.4,
                  height: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.mainColor,
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/Vector (23).png",
                        width: screenWidth * 0.15,
                      ),
                      SizedBox(height: screenWidth * 0.06),
                      Text(
                        "المحادثات",
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.wightcolor,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
