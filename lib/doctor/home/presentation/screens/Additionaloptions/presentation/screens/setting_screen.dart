import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, color: AppColors.mainColor),
                  SizedBox(width: 80.w),
                  Text(
                    'الاعدادات',
                    style: GoogleFonts.leagueSpartan(
                      color: AppColors.mainColor,
                      fontSize: 20.sp,
                    ),
                  ),
                  Spacer(),
                  Image.asset("assets/images/Group 111.png"),
                ],
              ),
            ),
            Divider(),
            
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  border: Border.all(color: AppColors.whitegradient),
                ),
                child: Row(
                  children: [
                    Icon(Icons.person_2_outlined, color: AppColors.mainColor),
                    SizedBox(width: 20.w),
                    Text(
                      'الملف الشخصي',
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.mainColor,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  border: Border.all(color: AppColors.whitegradient),
                ),

                child: Row(
                  children: [
                    Icon(Icons.person_2_outlined, color: AppColors.mainColor),
                    SizedBox(width: 20.w),
                    Text(
                      'حساب احترافي',
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.mainColor,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  border: Border.all(color: AppColors.whitegradient),
                ),
                child: Row(
                  children: [
                    Icon(Icons.person_2_outlined, color: AppColors.mainColor),
                    SizedBox(width: 20.w),
                    Text(
                      'إعدادات الحساب',
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.mainColor,
                        fontSize: 20.sp,
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
