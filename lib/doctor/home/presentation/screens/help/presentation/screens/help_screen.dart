import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/doctor/home/presentation/screens/help/presentation/screens/help_screen_gride.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    "المساعده",
                    style: GoogleFonts.leagueSpartan(
                      color: AppColors.mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Divider(),

            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GrideScreen()),
                  );
                },
                child: Container(
                  width: 354.w,
                  height: 54.h,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xff14C8C7)),
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/images/Group 110.png"),
                      SizedBox(width: 20.w),
                      Text(
                        'أسئلة شائعة',
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xff14C8C7)),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/Group 111.png"),
                    SizedBox(width: 20.w),
                    Text(
                      '''في حال واجهتك أي مشكلة بإمكانك 
     التواصل علي رقم01507825901''',
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.mainColor,
                        fontSize: 15,
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
    );
  }
}
