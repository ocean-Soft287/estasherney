import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       body:Column(
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
        ],
       )
      ),
    );
  }
}