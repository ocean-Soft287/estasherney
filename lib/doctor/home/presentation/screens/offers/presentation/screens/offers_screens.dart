import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OffersScreens extends StatelessWidget {
  const OffersScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: (Column(
          children: [
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.only(right: 20.h),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, color: AppColors.mainColor),
                  SizedBox(width: 100.w),
                  Text(
                    "عروض",
                    style: GoogleFonts.leagueSpartan(
                      color: AppColors.mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Divider(),
            SizedBox(height: 200.h),
            Center(
              child: Text(
                "لا توجد عروض حتى الآن",
                style: GoogleFonts.leagueSpartan(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
