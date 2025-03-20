import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class VitaminDTestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: Container(
        width: double.infinity,
        height: 160.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(
            colors: [Colors.blue.shade700, Colors.blue.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Background Image
            Positioned(
              left: 10.w,
              top: 20.h,
              child: Image.asset(
                "assets/images/image 3.png",
                width: 160.w,
                height: 130.h,
                fit: BoxFit.cover,
              ),
            ),

        
            Positioned(
  top: -0.h,
  right: 0.w,
  child: Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: AppColors.mainColor, // Border color
        width: 1.5.w, // Border width
      ),
    ),
    child: CircleAvatar(
      backgroundColor: AppColors.wightcolor, // Inner background color
      child: Text(
        "قريبًا",
        style: GoogleFonts.leagueSpartan(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.mainColor,
        ),
      ),
    ),
  ),
),


           
            Positioned(
              top: 30.h,
              right: 55.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  "تحليل فيتامين د",
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ),

           
            Positioned(
              top: 30.h, 
              right: 50.w,
              child: Image.asset(
                "assets/images/Rectangle 154.png",
                width: 123.w, 
                height: 106.h, 
              ),
            ),

            // Description Text
            Positioned(
              bottom: 50.h,
              right: 60.w,
              child: SizedBox(
                width: 180.w,
                child: Text(
                  "اطمئن على نسبة فيتامين\n د بسعر يبدأ من 200 \nجنيه",
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
