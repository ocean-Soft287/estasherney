import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/doctor/auth/data/model/login_model.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/available_times.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/calender_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

class CalendarScreens extends StatelessWidget {
  final LoginModel user;
  const CalendarScreens({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.only(right: 20.h),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, color: AppColors.mainColor),
                  SizedBox(width: 100.w),
                  Text(
                    "التقويم",
                    style: GoogleFonts.leagueSpartan(
                      color: AppColors.mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Divider(),
            SizedBox(height: 50.h),
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
                        MaterialPageRoute(builder: (context) => AvailableTimes(user: user,)),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/Vector (24).png",
                            width: screenWidth * 0.15,
                          ),
                          SizedBox(height: screenWidth * 0.05),
                          Text(
                            "الأوقات المتاحة",
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
                        MaterialPageRoute(builder: (context) => CalinderDay()),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/Group (5).png",
                            width: screenWidth * 0.15,
                          ),
                          SizedBox(height: screenWidth * 0.05),
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
          ],
        ),
      ),
    );
  }
}
